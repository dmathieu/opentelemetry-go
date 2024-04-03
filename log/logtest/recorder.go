// Copyright The OpenTelemetry Authors
// SPDX-License-Identifier: Apache-2.0

// Package logtest is a testing helper package. User can retrieve an in-memory
// logger to verify the behavior of their integrations.
package logtest // import "go.opentelemetry.io/otel/log/logtest"

import (
	"context"
	"sync"

	"go.opentelemetry.io/otel/log"
	"go.opentelemetry.io/otel/log/embedded"
)

// embeddedLogger is a type alias so the embedded.Logger type doesn't conflict
// with the Logger method of the recorder when it is embedded.
type embeddedLogger = embedded.Logger // nolint:unused  // Used below.

type enabledFn func(context.Context, log.Record) bool

// NewRecorder returns a new Recorder.
func NewRecorder(options ...Option) *Recorder {
	cfg := newConfig(options)

	sr := &ScopeRecords{}

	return &Recorder{
		scopeRecords:       []*ScopeRecords{sr},
		currentScopeRecord: sr,
		enabledFn:          cfg.enabledFn,
	}
}

// ScopeRecords represents the records for instrumentation scope.
type ScopeRecords struct {
	// Name is the name of the instrumentation scope.
	Name string
	// Version is the version of the instrumentation scope.
	Version string
	// SchemaURL of the telemetry emitted by the scope.
	SchemaURL string

	// The log records this instrumentation recorded
	Records []log.Record
}

// Recorder is a recorder that stores all received log records
// in-memory.
type Recorder struct {
	embedded.LoggerProvider
	embeddedLogger // nolint:unused  // Used to embed embedded.Logger.

	mu sync.Mutex

	scopeRecords       []*ScopeRecords
	currentScopeRecord *ScopeRecords

	// enabledFn decides whether the recorder should enable logging of a record or not
	enabledFn enabledFn
}

// Logger retrieves a copy of Recorder with the provided scope
// information.
func (r *Recorder) Logger(name string, opts ...log.LoggerOption) log.Logger {
	r.mu.Lock()
	defer r.mu.Unlock()

	cfg := log.NewLoggerConfig(opts...)

	sr := &ScopeRecords{
		Name:      name,
		Version:   cfg.InstrumentationVersion(),
		SchemaURL: cfg.SchemaURL(),
	}
	r.scopeRecords = append(r.scopeRecords, sr)

	nr := &Recorder{
		scopeRecords:       r.scopeRecords,
		currentScopeRecord: sr,
		enabledFn:          r.enabledFn,
	}

	return nr
}

// Enabled indicates whether a specific record should be stored
func (r *Recorder) Enabled(ctx context.Context, record log.Record) bool {
	return r.enabledFn(ctx, record)
}

// Emit stores the log record.
func (r *Recorder) Emit(_ context.Context, record log.Record) {
	r.mu.Lock()
	defer r.mu.Unlock()

	r.currentScopeRecord.Records = append(r.currentScopeRecord.Records, record)
}

// Result returns the current in-memory recorder log records.
func (r *Recorder) Result() []*ScopeRecords {
	r.mu.Lock()
	defer r.mu.Unlock()
	ret := make([]*ScopeRecords, len(r.scopeRecords))
	copy(ret, r.scopeRecords)
	return ret
}

// Reset clears the in-memory log records for the current scope.
func (r *Recorder) Reset() {
	r.mu.Lock()
	defer r.mu.Unlock()
	r.currentScopeRecord.Records = []log.Record{}
}
