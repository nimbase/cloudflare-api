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

suite "r2_bucket serialization":
  test "round-trips R2V4Response":
    let obj = newR2V4Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4Response)) == openjson.toJson(obj)

  test "round-trips R2BucketLockRuleConfig":
    let obj = newR2BucketLockRuleConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2BucketLockRuleConfig)) == openjson.toJson(obj)

  test "round-trips R2RemoveCustomDomainResponse":
    let obj = newR2RemoveCustomDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2RemoveCustomDomainResponse)) == openjson.toJson(obj)

  test "round-trips R2V4ResponseFailure":
    let obj = newR2V4ResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4ResponseFailure)) == openjson.toJson(obj)

  test "round-trips R2GetCustomDomainResponse":
    let obj = newR2GetCustomDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2GetCustomDomainResponse)) == openjson.toJson(obj)

  test "round-trips R2ListCustomDomainsResponse":
    let obj = newR2ListCustomDomainsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2ListCustomDomainsResponse)) == openjson.toJson(obj)

  test "round-trips R2ManagedDomainResponse":
    let obj = newR2ManagedDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2ManagedDomainResponse)) == openjson.toJson(obj)

  test "round-trips R2Bucket":
    let obj = newR2Bucket()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2Bucket)) == openjson.toJson(obj)

  test "round-trips R2TempAccessCredsResponse":
    let obj = newR2TempAccessCredsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2TempAccessCredsResponse)) == openjson.toJson(obj)

  test "round-trips R2V4ResponseList":
    let obj = newR2V4ResponseList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4ResponseList)) == openjson.toJson(obj)

  test "round-trips R2EditCustomDomainRequest":
    let obj = newR2EditCustomDomainRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2EditCustomDomainRequest)) == openjson.toJson(obj)

  test "round-trips R2AddCustomDomainRequest":
    let obj = newR2AddCustomDomainRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2AddCustomDomainRequest)) == openjson.toJson(obj)

  test "round-trips R2R2BucketJob":
    let obj = newR2R2BucketJob()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2BucketJob)) == openjson.toJson(obj)

  test "round-trips R2LocalUploadsConfiguration":
    let obj = newR2LocalUploadsConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2LocalUploadsConfiguration)) == openjson.toJson(obj)

  test "round-trips R2CorsRule":
    let obj = newR2CorsRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2CorsRule)) == openjson.toJson(obj)

  test "round-trips R2LifecycleRule":
    let obj = newR2LifecycleRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2LifecycleRule)) == openjson.toJson(obj)

  test "round-trips R2QueuesConfig":
    let obj = newR2QueuesConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2QueuesConfig)) == openjson.toJson(obj)

  test "round-trips R2BucketConfig":
    let obj = newR2BucketConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2BucketConfig)) == openjson.toJson(obj)

  test "round-trips R2EditCustomDomainResponse":
    let obj = newR2EditCustomDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2EditCustomDomainResponse)) == openjson.toJson(obj)

  test "round-trips R2AddCustomDomainResponse":
    let obj = newR2AddCustomDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2AddCustomDomainResponse)) == openjson.toJson(obj)

  test "round-trips R2EditManagedDomainRequest":
    let obj = newR2EditManagedDomainRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2EditManagedDomainRequest)) == openjson.toJson(obj)

  test "round-trips R2BucketLockRule":
    let obj = newR2BucketLockRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2BucketLockRule)) == openjson.toJson(obj)

  test "round-trips R2LifecycleConfig":
    let obj = newR2LifecycleConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2LifecycleConfig)) == openjson.toJson(obj)

  test "round-trips R2TempAccessCredsRequest":
    let obj = newR2TempAccessCredsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2TempAccessCredsRequest)) == openjson.toJson(obj)

  test "round-trips R2Rule":
    let obj = newR2Rule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2Rule)) == openjson.toJson(obj)

  test "round-trips R2R2BucketJobsResult":
    let obj = newR2R2BucketJobsResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2BucketJobsResult)) == openjson.toJson(obj)

  test "round-trips R2Sippy":
    let obj = newR2Sippy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2Sippy)) == openjson.toJson(obj)

suite "r2_bucket endpoints":
  test "GET /accounts/{account_id}/event_notifications/r2/{bucket_name}/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEventNotificationsR2BucketNameConfiguration("test", "test")

  test "GET /accounts/{account_id}/event_notifications/r2/{bucket_name}/configuration/queues/{queue_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueId("test", "test", "test")

  test "GET /accounts/{account_id}/r2/buckets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2Buckets("test", "test", "test", 1.0, {}, {}, "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketName("test", "test")

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketName("test", "test")

  test "PATCH /accounts/{account_id}/r2/buckets/{bucket_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdR2BucketsBucketName("test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/cors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameCors("test", "test")

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}/cors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketNameCors("test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/domains/custom":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameDomainsCustom("test", "test")

  test "POST /accounts/{account_id}/r2/buckets/{bucket_name}/domains/custom":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2BucketsBucketNameDomainsCustom("test", "test", newR2AddCustomDomainRequest())

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/domains/custom/{domain}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain("test", "test", "test")

  test "PUT /accounts/{account_id}/r2/buckets/{bucket_name}/domains/custom/{domain}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain("test", "test", "test", newR2EditCustomDomainRequest())

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}/domains/custom/{domain}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain("test", "test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/domains/managed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameDomainsManaged("test", "test")

  test "PUT /accounts/{account_id}/r2/buckets/{bucket_name}/domains/managed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdR2BucketsBucketNameDomainsManaged("test", "test", newR2EditManagedDomainRequest())

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/jobs/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameJobsJobId("test", "test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/lifecycle":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameLifecycle("test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/local-uploads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameLocalUploads("test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/lock":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameLock("test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/sippy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameSippy("test", "test")

  test "PUT /accounts/{account_id}/r2/buckets/{bucket_name}/sippy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdR2BucketsBucketNameSippy("test", "test")

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}/sippy":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketNameSippy("test", "test")

  test "POST /accounts/{account_id}/r2/temp-access-credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdR2TempAccessCredentials("test", newR2TempAccessCredsRequest())

