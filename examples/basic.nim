# cloudflare — runnable example
#
# Auto-generated from OpenAPI 3.x via Nimbase. Run with:
#   nim r examples/basic.nim

import cloudflare
import std/asyncdispatch

proc main() {.async.} =
  let client = initCloudflareClient("your-api-key")
  client.baseUri = "https://api.cloudflare.com/client/v4"
  try:
    let res = await client.getAccounts("test", 1.0, 1.0, {})
    echo res
  except CatchableError as e:
    echo "request failed: ", e.msg


when isMainModule:
  waitFor main()
