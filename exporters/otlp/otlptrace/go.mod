module go.opentelemetry.io/otel/exporters/otlp/otlptrace

go 1.21.12

toolchain go1.22.5

require (
	github.com/google/go-cmp v0.6.0
	github.com/stretchr/testify v1.9.0
	go.opentelemetry.io/otel v1.28.0
	go.opentelemetry.io/otel/sdk v1.28.0
	go.opentelemetry.io/otel/trace v1.28.0
	go.opentelemetry.io/proto/otlp/common v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/proto/otlp/resource v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/proto/otlp/trace v0.0.0-00010101000000-000000000000
	google.golang.org/protobuf v1.34.2
)

require (
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/kr/pretty v0.3.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/rogpeppe/go-internal v1.12.0 // indirect
	go.opentelemetry.io/otel/metric v1.28.0 // indirect
	golang.org/x/sys v0.22.0 // indirect
	gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace go.opentelemetry.io/otel => ../../..

replace go.opentelemetry.io/otel/sdk => ../../../sdk

replace go.opentelemetry.io/otel/trace => ../../../trace

replace go.opentelemetry.io/otel/metric => ../../../metric

replace go.opentelemetry.io/proto/otlp => ../../../../opentelemetry-proto-go/otlp

replace go.opentelemetry.io/proto/otlp/collector => ../../../../opentelemetry-proto-go/otlp/collector

replace go.opentelemetry.io/proto/otlp/common => ../../../../opentelemetry-proto-go/otlp/common

replace go.opentelemetry.io/proto/otlp/logs => ../../../../opentelemetry-proto-go/otlp/logs

replace go.opentelemetry.io/proto/otlp/metrics => ../../../../opentelemetry-proto-go/otlp/metrics

replace go.opentelemetry.io/proto/otlp/profiles => ../../../../opentelemetry-proto-go/otlp/profiles

replace go.opentelemetry.io/proto/otlp/resource => ../../../../opentelemetry-proto-go/otlp/resource

replace go.opentelemetry.io/proto/otlp/trace => ../../../../opentelemetry-proto-go/otlp/trace
