# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import cloudflare
import ./common

suite "worker_profiling serialization":
  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersErrorInternalServer":
    let obj = newWorkersErrorInternalServer()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersErrorInternalServer)) == openjson.toJson(obj)

  test "round-trips WorkersErrorAuth":
    let obj = newWorkersErrorAuth()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersErrorAuth)) == openjson.toJson(obj)

suite "worker_profiling endpoints":
  test "module has no sampleable endpoints":
    check true

