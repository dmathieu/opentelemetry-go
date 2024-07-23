module go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp

go 1.21.12

toolchain go1.22.5

require (
	github.com/cenkalti/backoff/v4 v4.3.0
	github.com/stretchr/testify v1.9.0
	go.opentelemetry.io/otel v1.28.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.28.0
	go.opentelemetry.io/otel/sdk v1.28.0
	go.opentelemetry.io/otel/trace v1.28.0
	go.opentelemetry.io/proto/otlp/collector v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/proto/otlp/common v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/proto/otlp/resource v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/proto/otlp/trace v0.0.0-00010101000000-000000000000
	google.golang.org/grpc v1.65.0
	google.golang.org/protobuf v1.34.2
)

require (
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.20.0 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	go.opentelemetry.io/otel/metric v1.28.0 // indirect
	golang.org/x/net v0.27.0 // indirect
	golang.org/x/sys v0.22.0 // indirect
	golang.org/x/text v0.16.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20240722135656-d784300faade // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240722135656-d784300faade // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace go.opentelemetry.io/otel/exporters/otlp/otlptrace => ../

replace go.opentelemetry.io/otel => ../../../..

replace go.opentelemetry.io/otel/sdk => ../../../../sdk

replace go.opentelemetry.io/otel/trace => ../../../../trace

replace go.opentelemetry.io/otel/metric => ../../../../metric

replace go.opentelemetry.io/proto/otlp => ../../../../../opentelemetry-proto-go/otlp

replace go.opentelemetry.io/proto/otlp/collector => ../../../../../opentelemetry-proto-go/otlp/collector

replace go.opentelemetry.io/proto/otlp/common => ../../../../../opentelemetry-proto-go/otlp/common

replace go.opentelemetry.io/proto/otlp/logs => ../../../../../opentelemetry-proto-go/otlp/logs

replace go.opentelemetry.io/proto/otlp/metrics => ../../../../../opentelemetry-proto-go/otlp/metrics

replace go.opentelemetry.io/proto/otlp/profiles => ../../../../../opentelemetry-proto-go/otlp/profiles

replace go.opentelemetry.io/proto/otlp/resource => ../../../../../opentelemetry-proto-go/otlp/resource

replace go.opentelemetry.io/proto/otlp/trace => ../../../../../opentelemetry-proto-go/otlp/trace
