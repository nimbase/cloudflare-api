import ./types

proc renameHook*(v: AaaAuditLogs, fieldName: var string) {.inline.} =
  if fieldName == "newValue":
    fieldName = "new_value"
  elif fieldName == "new_value":
    fieldName = "newValue"
  elif fieldName == "oldValue":
    fieldName = "old_value"
  elif fieldName == "old_value":
    fieldName = "oldValue"

proc renameHook*(v: AccessAzureGroupRule, fieldName: var string) {.inline.} =
  if fieldName == "azureAD":
    fieldName = "azure_a_d"
  elif fieldName == "azure_a_d":
    fieldName = "azureAD"

proc renameHook*(v: AccessGithubOrganizationRule, fieldName: var string) {.inline.} =
  if fieldName == "github-organization":
    fieldName = "github_organization"
  elif fieldName == "github_organization":
    fieldName = "github-organization"

proc renameHook*(v: AccessGroups, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"

proc renameHook*(v: AccessIdentity, fieldName: var string) {.inline.} =
  if fieldName == "devicePosture":
    fieldName = "device_posture"
  elif fieldName == "device_posture":
    fieldName = "devicePosture"

proc renameHook*(v: AccessMeta, fieldName: var string) {.inline.} =
  if fieldName == "lastModified":
    fieldName = "last_modified"
  elif fieldName == "last_modified":
    fieldName = "lastModified"

proc renameHook*(v: AccessUsers, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"

proc renameHook*(v: AiAuditContentSignal, fieldName: var string) {.inline.} =
  if fieldName == "ai-input":
    fieldName = "ai_input"
  elif fieldName == "ai_input":
    fieldName = "ai-input"
  elif fieldName == "ai-train":
    fieldName = "ai_train"
  elif fieldName == "ai_train":
    fieldName = "ai-train"

proc renameHook*(v: AiAuditRobotsRules, fieldName: var string) {.inline.} =
  if fieldName == "userAgents":
    fieldName = "user_agents"
  elif fieldName == "user_agents":
    fieldName = "userAgents"

proc renameHook*(v: AiAuditUserAgentRules, fieldName: var string) {.inline.} =
  if fieldName == "contentSignals":
    fieldName = "content_signals"
  elif fieldName == "content_signals":
    fieldName = "contentSignals"
  elif fieldName == "crawlDelay":
    fieldName = "crawl_delay"
  elif fieldName == "crawl_delay":
    fieldName = "crawlDelay"

proc renameHook*(v: AigBillingGetTopupConfigResult, fieldName: var string) {.inline.} =
  if fieldName == "disabledReason":
    fieldName = "disabled_reason"
  elif fieldName == "disabled_reason":
    fieldName = "disabledReason"
  elif fieldName == "lastFailedAt":
    fieldName = "last_failed_at"
  elif fieldName == "last_failed_at":
    fieldName = "lastFailedAt"

proc renameHook*(v: ApiShieldOperationSchemaFragment, fieldName: var string) {.inline.} =
  if fieldName == "requestBody":
    fieldName = "request_body"
  elif fieldName == "request_body":
    fieldName = "requestBody"

proc renameHook*(v: ArtCommonQuery, fieldName: var string) {.inline.} =
  if fieldName == "groupBy":
    fieldName = "group_by"
  elif fieldName == "group_by":
    fieldName = "groupBy"

proc renameHook*(v: ArtQuerySummary, fieldName: var string) {.inline.} =
  if fieldName == "groupBy":
    fieldName = "group_by"
  elif fieldName == "group_by":
    fieldName = "groupBy"

proc renameHook*(v: ArtQueryTimeseries, fieldName: var string) {.inline.} =
  if fieldName == "groupBy":
    fieldName = "group_by"
  elif fieldName == "group_by":
    fieldName = "groupBy"

proc renameHook*(v: ArtQueryTopN, fieldName: var string) {.inline.} =
  if fieldName == "groupBy":
    fieldName = "group_by"
  elif fieldName == "group_by":
    fieldName = "groupBy"
  elif fieldName == "orderBy":
    fieldName = "order_by"
  elif fieldName == "order_by":
    fieldName = "orderBy"

proc renameHook*(v: ArtSummaryResult, fieldName: var string) {.inline.} =
  if fieldName == "currentTotal":
    fieldName = "current_total"
  elif fieldName == "current_total":
    fieldName = "currentTotal"
  elif fieldName == "previousTotal":
    fieldName = "previous_total"
  elif fieldName == "previous_total":
    fieldName = "previousTotal"

proc renameHook*(v: BillableUsageApiCostAndUsageData, fieldName: var string) {.inline.} =
  if fieldName == "BilledCost":
    fieldName = "billed_cost"
  elif fieldName == "billed_cost":
    fieldName = "BilledCost"
  elif fieldName == "BillingAccountId":
    fieldName = "billing_account_id"
  elif fieldName == "billing_account_id":
    fieldName = "BillingAccountId"
  elif fieldName == "BillingAccountName":
    fieldName = "billing_account_name"
  elif fieldName == "billing_account_name":
    fieldName = "BillingAccountName"
  elif fieldName == "BillingCurrency":
    fieldName = "billing_currency"
  elif fieldName == "billing_currency":
    fieldName = "BillingCurrency"
  elif fieldName == "BillingPeriodEnd":
    fieldName = "billing_period_end"
  elif fieldName == "billing_period_end":
    fieldName = "BillingPeriodEnd"
  elif fieldName == "BillingPeriodStart":
    fieldName = "billing_period_start"
  elif fieldName == "billing_period_start":
    fieldName = "BillingPeriodStart"
  elif fieldName == "ChargeCategory":
    fieldName = "charge_category"
  elif fieldName == "charge_category":
    fieldName = "ChargeCategory"
  elif fieldName == "ChargeClass":
    fieldName = "charge_class"
  elif fieldName == "charge_class":
    fieldName = "ChargeClass"
  elif fieldName == "ChargeDescription":
    fieldName = "charge_description"
  elif fieldName == "charge_description":
    fieldName = "ChargeDescription"
  elif fieldName == "ChargeFrequency":
    fieldName = "charge_frequency"
  elif fieldName == "charge_frequency":
    fieldName = "ChargeFrequency"
  elif fieldName == "ChargePeriodEnd":
    fieldName = "charge_period_end"
  elif fieldName == "charge_period_end":
    fieldName = "ChargePeriodEnd"
  elif fieldName == "ChargePeriodStart":
    fieldName = "charge_period_start"
  elif fieldName == "charge_period_start":
    fieldName = "ChargePeriodStart"
  elif fieldName == "ConsumedQuantity":
    fieldName = "consumed_quantity"
  elif fieldName == "consumed_quantity":
    fieldName = "ConsumedQuantity"
  elif fieldName == "ConsumedUnit":
    fieldName = "consumed_unit"
  elif fieldName == "consumed_unit":
    fieldName = "ConsumedUnit"
  elif fieldName == "ContractedCost":
    fieldName = "contracted_cost"
  elif fieldName == "contracted_cost":
    fieldName = "ContractedCost"
  elif fieldName == "ContractedUnitPrice":
    fieldName = "contracted_unit_price"
  elif fieldName == "contracted_unit_price":
    fieldName = "ContractedUnitPrice"
  elif fieldName == "EffectiveCost":
    fieldName = "effective_cost"
  elif fieldName == "effective_cost":
    fieldName = "EffectiveCost"
  elif fieldName == "HostProviderName":
    fieldName = "host_provider_name"
  elif fieldName == "host_provider_name":
    fieldName = "HostProviderName"
  elif fieldName == "InvoiceIssuerName":
    fieldName = "invoice_issuer_name"
  elif fieldName == "invoice_issuer_name":
    fieldName = "InvoiceIssuerName"
  elif fieldName == "ListCost":
    fieldName = "list_cost"
  elif fieldName == "list_cost":
    fieldName = "ListCost"
  elif fieldName == "ListUnitPrice":
    fieldName = "list_unit_price"
  elif fieldName == "list_unit_price":
    fieldName = "ListUnitPrice"
  elif fieldName == "PricingQuantity":
    fieldName = "pricing_quantity"
  elif fieldName == "pricing_quantity":
    fieldName = "PricingQuantity"
  elif fieldName == "PricingUnit":
    fieldName = "pricing_unit"
  elif fieldName == "pricing_unit":
    fieldName = "PricingUnit"
  elif fieldName == "RegionId":
    fieldName = "region_id"
  elif fieldName == "region_id":
    fieldName = "RegionId"
  elif fieldName == "RegionName":
    fieldName = "region_name"
  elif fieldName == "region_name":
    fieldName = "RegionName"
  elif fieldName == "ServiceProviderName":
    fieldName = "service_provider_name"
  elif fieldName == "service_provider_name":
    fieldName = "ServiceProviderName"
  elif fieldName == "SubAccountId":
    fieldName = "sub_account_id"
  elif fieldName == "sub_account_id":
    fieldName = "SubAccountId"
  elif fieldName == "SubAccountName":
    fieldName = "sub_account_name"
  elif fieldName == "sub_account_name":
    fieldName = "SubAccountName"
  elif fieldName == "x_BillableMetricId":
    fieldName = "x_billable_metric_id"
  elif fieldName == "x_billable_metric_id":
    fieldName = "x_BillableMetricId"
  elif fieldName == "x_BillableMetricName":
    fieldName = "x_billable_metric_name"
  elif fieldName == "x_billable_metric_name":
    fieldName = "x_BillableMetricName"
  elif fieldName == "x_ProductCategoryName":
    fieldName = "x_product_category_name"
  elif fieldName == "x_product_category_name":
    fieldName = "x_ProductCategoryName"
  elif fieldName == "x_ProductFamilyId":
    fieldName = "x_product_family_id"
  elif fieldName == "x_product_family_id":
    fieldName = "x_ProductFamilyId"
  elif fieldName == "x_ProductFamilyName":
    fieldName = "x_product_family_name"
  elif fieldName == "x_product_family_name":
    fieldName = "x_ProductFamilyName"
  elif fieldName == "x_ZoneId":
    fieldName = "x_zone_id"
  elif fieldName == "x_zone_id":
    fieldName = "x_ZoneId"
  elif fieldName == "x_ZoneName":
    fieldName = "x_zone_name"
  elif fieldName == "x_zone_name":
    fieldName = "x_ZoneName"

proc renameHook*(v: BillableUsageApiUsageRecord, fieldName: var string) {.inline.} =
  if fieldName == "BilledCost":
    fieldName = "billed_cost"
  elif fieldName == "billed_cost":
    fieldName = "BilledCost"
  elif fieldName == "BillingAccountId":
    fieldName = "billing_account_id"
  elif fieldName == "billing_account_id":
    fieldName = "BillingAccountId"
  elif fieldName == "BillingAccountName":
    fieldName = "billing_account_name"
  elif fieldName == "billing_account_name":
    fieldName = "BillingAccountName"
  elif fieldName == "BillingCurrency":
    fieldName = "billing_currency"
  elif fieldName == "billing_currency":
    fieldName = "BillingCurrency"
  elif fieldName == "BillingPeriodStart":
    fieldName = "billing_period_start"
  elif fieldName == "billing_period_start":
    fieldName = "BillingPeriodStart"
  elif fieldName == "ChargeCategory":
    fieldName = "charge_category"
  elif fieldName == "charge_category":
    fieldName = "ChargeCategory"
  elif fieldName == "ChargeClass":
    fieldName = "charge_class"
  elif fieldName == "charge_class":
    fieldName = "ChargeClass"
  elif fieldName == "ChargeDescription":
    fieldName = "charge_description"
  elif fieldName == "charge_description":
    fieldName = "ChargeDescription"
  elif fieldName == "ChargePeriodEnd":
    fieldName = "charge_period_end"
  elif fieldName == "charge_period_end":
    fieldName = "ChargePeriodEnd"
  elif fieldName == "ChargePeriodStart":
    fieldName = "charge_period_start"
  elif fieldName == "charge_period_start":
    fieldName = "ChargePeriodStart"
  elif fieldName == "ConsumedQuantity":
    fieldName = "consumed_quantity"
  elif fieldName == "consumed_quantity":
    fieldName = "ConsumedQuantity"
  elif fieldName == "ConsumedUnit":
    fieldName = "consumed_unit"
  elif fieldName == "consumed_unit":
    fieldName = "ConsumedUnit"
  elif fieldName == "ContractedCost":
    fieldName = "contracted_cost"
  elif fieldName == "contracted_cost":
    fieldName = "ContractedCost"
  elif fieldName == "CumulatedContractedCost":
    fieldName = "cumulated_contracted_cost"
  elif fieldName == "cumulated_contracted_cost":
    fieldName = "CumulatedContractedCost"
  elif fieldName == "CumulatedPricingQuantity":
    fieldName = "cumulated_pricing_quantity"
  elif fieldName == "cumulated_pricing_quantity":
    fieldName = "CumulatedPricingQuantity"
  elif fieldName == "EffectiveCost":
    fieldName = "effective_cost"
  elif fieldName == "effective_cost":
    fieldName = "EffectiveCost"
  elif fieldName == "HostProviderName":
    fieldName = "host_provider_name"
  elif fieldName == "host_provider_name":
    fieldName = "HostProviderName"
  elif fieldName == "InvoiceIssuerName":
    fieldName = "invoice_issuer_name"
  elif fieldName == "invoice_issuer_name":
    fieldName = "InvoiceIssuerName"
  elif fieldName == "ListCost":
    fieldName = "list_cost"
  elif fieldName == "list_cost":
    fieldName = "ListCost"
  elif fieldName == "PricingQuantity":
    fieldName = "pricing_quantity"
  elif fieldName == "pricing_quantity":
    fieldName = "PricingQuantity"
  elif fieldName == "PricingUnit":
    fieldName = "pricing_unit"
  elif fieldName == "pricing_unit":
    fieldName = "PricingUnit"
  elif fieldName == "ServiceFamilyName":
    fieldName = "service_family_name"
  elif fieldName == "service_family_name":
    fieldName = "ServiceFamilyName"
  elif fieldName == "ServiceName":
    fieldName = "service_name"
  elif fieldName == "service_name":
    fieldName = "ServiceName"
  elif fieldName == "ServiceProviderName":
    fieldName = "service_provider_name"
  elif fieldName == "service_provider_name":
    fieldName = "ServiceProviderName"
  elif fieldName == "SubscriptionId":
    fieldName = "subscription_id"
  elif fieldName == "subscription_id":
    fieldName = "SubscriptionId"
  elif fieldName == "ZoneId":
    fieldName = "zone_id"
  elif fieldName == "zone_id":
    fieldName = "ZoneId"
  elif fieldName == "ZoneName":
    fieldName = "zone_name"
  elif fieldName == "zone_name":
    fieldName = "ZoneName"

proc renameHook*(v: BillableUsageApiV2FilterBy, fieldName: var string) {.inline.} =
  if fieldName == "MetricIds":
    fieldName = "metric_ids"
  elif fieldName == "metric_ids":
    fieldName = "MetricIds"
  elif fieldName == "ProductFamilyIds":
    fieldName = "product_family_ids"
  elif fieldName == "product_family_ids":
    fieldName = "ProductFamilyIds"

proc renameHook*(v: BillableUsageApiV2TimePeriod, fieldName: var string) {.inline.} =
  if fieldName == "From":
    fieldName = "from"
  elif fieldName == "from":
    fieldName = "From"
  elif fieldName == "To":
    fieldName = "to"
  elif fieldName == "to":
    fieldName = "To"

proc renameHook*(v: BillableUsageApiV2UsageQuery, fieldName: var string) {.inline.} =
  if fieldName == "FilterBy":
    fieldName = "filter_by"
  elif fieldName == "filter_by":
    fieldName = "FilterBy"
  elif fieldName == "TimePeriod":
    fieldName = "time_period"
  elif fieldName == "time_period":
    fieldName = "TimePeriod"

proc renameHook*(v: BuildsBuildSeedRepoInputFile, fieldName: var string) {.inline.} =
  if fieldName == "isBase64":
    fieldName = "is_base64"
  elif fieldName == "is_base64":
    fieldName = "isBase64"

proc renameHook*(v: CacheRulesOriginCloudRegionBatchItemResult, fieldName: var string) {.inline.} =
  if fieldName == "origin-ip":
    fieldName = "origin_ip"
  elif fieldName == "origin_ip":
    fieldName = "origin-ip"

proc renameHook*(v: CacheRulesOriginCloudRegionEntry, fieldName: var string) {.inline.} =
  if fieldName == "origin-ip":
    fieldName = "origin_ip"
  elif fieldName == "origin_ip":
    fieldName = "origin-ip"

proc renameHook*(v: CcPlacementEvent, fieldName: var string) {.inline.} =
  if fieldName == "statusChange":
    fieldName = "status_change"
  elif fieldName == "status_change":
    fieldName = "statusChange"

proc renameHook*(v: CloudforceOneEventsFieldDefinition, fieldName: var string) {.inline.} =
  if fieldName == "allowedValues":
    fieldName = "allowed_values"
  elif fieldName == "allowed_values":
    fieldName = "allowedValues"
  elif fieldName == "maxLength":
    fieldName = "max_length"
  elif fieldName == "max_length":
    fieldName = "maxLength"
  elif fieldName == "numberConstraint":
    fieldName = "number_constraint"
  elif fieldName == "number_constraint":
    fieldName = "numberConstraint"

proc renameHook*(v: CpsCommunicationPreferences, fieldName: var string) {.inline.} =
  if fieldName == "language-locale":
    fieldName = "language_locale"
  elif fieldName == "language_locale":
    fieldName = "language-locale"

proc renameHook*(v: CpsUpdateCommunicationPreferencesRequest, fieldName: var string) {.inline.} =
  if fieldName == "language-locale":
    fieldName = "language_locale"
  elif fieldName == "language_locale":
    fieldName = "language-locale"

proc renameHook*(v: DigitalExperienceMonitoringAggregateStat, fieldName: var string) {.inline.} =
  if fieldName == "avgMs":
    fieldName = "avg_ms"
  elif fieldName == "avg_ms":
    fieldName = "avgMs"
  elif fieldName == "deltaPct":
    fieldName = "delta_pct"
  elif fieldName == "delta_pct":
    fieldName = "deltaPct"
  elif fieldName == "timePeriod":
    fieldName = "time_period"
  elif fieldName == "time_period":
    fieldName = "timePeriod"

proc renameHook*(v: DigitalExperienceMonitoringAggregateTimeSlot, fieldName: var string) {.inline.} =
  if fieldName == "avgMs":
    fieldName = "avg_ms"
  elif fieldName == "avg_ms":
    fieldName = "avgMs"

proc renameHook*(v: DigitalExperienceMonitoringDevice, fieldName: var string) {.inline.} =
  if fieldName == "alwaysOn":
    fieldName = "always_on"
  elif fieldName == "always_on":
    fieldName = "alwaysOn"
  elif fieldName == "batteryCharging":
    fieldName = "battery_charging"
  elif fieldName == "battery_charging":
    fieldName = "batteryCharging"
  elif fieldName == "batteryCycles":
    fieldName = "battery_cycles"
  elif fieldName == "battery_cycles":
    fieldName = "batteryCycles"
  elif fieldName == "batteryPct":
    fieldName = "battery_pct"
  elif fieldName == "battery_pct":
    fieldName = "batteryPct"
  elif fieldName == "connectionType":
    fieldName = "connection_type"
  elif fieldName == "connection_type":
    fieldName = "connectionType"
  elif fieldName == "cpuPct":
    fieldName = "cpu_pct"
  elif fieldName == "cpu_pct":
    fieldName = "cpuPct"
  elif fieldName == "cpuPctByApp":
    fieldName = "cpu_pct_by_app"
  elif fieldName == "cpu_pct_by_app":
    fieldName = "cpuPctByApp"
  elif fieldName == "deviceId":
    fieldName = "device_id"
  elif fieldName == "device_id":
    fieldName = "deviceId"
  elif fieldName == "deviceIpv4":
    fieldName = "device_ipv4"
  elif fieldName == "device_ipv4":
    fieldName = "deviceIpv4"
  elif fieldName == "deviceIpv6":
    fieldName = "device_ipv6"
  elif fieldName == "device_ipv6":
    fieldName = "deviceIpv6"
  elif fieldName == "deviceName":
    fieldName = "device_name"
  elif fieldName == "device_name":
    fieldName = "deviceName"
  elif fieldName == "deviceRegistration":
    fieldName = "device_registration"
  elif fieldName == "device_registration":
    fieldName = "deviceRegistration"
  elif fieldName == "diskReadBps":
    fieldName = "disk_read_bps"
  elif fieldName == "disk_read_bps":
    fieldName = "diskReadBps"
  elif fieldName == "diskUsagePct":
    fieldName = "disk_usage_pct"
  elif fieldName == "disk_usage_pct":
    fieldName = "diskUsagePct"
  elif fieldName == "diskWriteBps":
    fieldName = "disk_write_bps"
  elif fieldName == "disk_write_bps":
    fieldName = "diskWriteBps"
  elif fieldName == "dohSubdomain":
    fieldName = "doh_subdomain"
  elif fieldName == "doh_subdomain":
    fieldName = "dohSubdomain"
  elif fieldName == "estimatedLossPct":
    fieldName = "estimated_loss_pct"
  elif fieldName == "estimated_loss_pct":
    fieldName = "estimatedLossPct"
  elif fieldName == "firewallEnabled":
    fieldName = "firewall_enabled"
  elif fieldName == "firewall_enabled":
    fieldName = "firewallEnabled"
  elif fieldName == "gatewayIpv4":
    fieldName = "gateway_ipv4"
  elif fieldName == "gateway_ipv4":
    fieldName = "gatewayIpv4"
  elif fieldName == "gatewayIpv6":
    fieldName = "gateway_ipv6"
  elif fieldName == "gateway_ipv6":
    fieldName = "gatewayIpv6"
  elif fieldName == "handshakeLatencyMs":
    fieldName = "handshake_latency_ms"
  elif fieldName == "handshake_latency_ms":
    fieldName = "handshakeLatencyMs"
  elif fieldName == "ispIpv4":
    fieldName = "isp_ipv4"
  elif fieldName == "isp_ipv4":
    fieldName = "ispIpv4"
  elif fieldName == "ispIpv6":
    fieldName = "isp_ipv6"
  elif fieldName == "isp_ipv6":
    fieldName = "ispIpv6"
  elif fieldName == "networkRcvdBps":
    fieldName = "network_rcvd_bps"
  elif fieldName == "network_rcvd_bps":
    fieldName = "networkRcvdBps"
  elif fieldName == "networkSentBps":
    fieldName = "network_sent_bps"
  elif fieldName == "network_sent_bps":
    fieldName = "networkSentBps"
  elif fieldName == "networkSsid":
    fieldName = "network_ssid"
  elif fieldName == "network_ssid":
    fieldName = "networkSsid"
  elif fieldName == "personEmail":
    fieldName = "person_email"
  elif fieldName == "person_email":
    fieldName = "personEmail"
  elif fieldName == "ramAvailableKb":
    fieldName = "ram_available_kb"
  elif fieldName == "ram_available_kb":
    fieldName = "ramAvailableKb"
  elif fieldName == "ramUsedPct":
    fieldName = "ram_used_pct"
  elif fieldName == "ram_used_pct":
    fieldName = "ramUsedPct"
  elif fieldName == "ramUsedPctByApp":
    fieldName = "ram_used_pct_by_app"
  elif fieldName == "ram_used_pct_by_app":
    fieldName = "ramUsedPctByApp"
  elif fieldName == "registrationId":
    fieldName = "registration_id"
  elif fieldName == "registration_id":
    fieldName = "registrationId"
  elif fieldName == "switchLocked":
    fieldName = "switch_locked"
  elif fieldName == "switch_locked":
    fieldName = "switchLocked"
  elif fieldName == "tunnelStats":
    fieldName = "tunnel_stats"
  elif fieldName == "tunnel_stats":
    fieldName = "tunnelStats"
  elif fieldName == "tunnelType":
    fieldName = "tunnel_type"
  elif fieldName == "tunnel_type":
    fieldName = "tunnelType"
  elif fieldName == "wifiStrengthDbm":
    fieldName = "wifi_strength_dbm"
  elif fieldName == "wifi_strength_dbm":
    fieldName = "wifiStrengthDbm"

proc renameHook*(v: DigitalExperienceMonitoringHttpDetailsPercentilesResponse, fieldName: var string) {.inline.} =
  if fieldName == "dnsResponseTimeMs":
    fieldName = "dns_response_time_ms"
  elif fieldName == "dns_response_time_ms":
    fieldName = "dnsResponseTimeMs"
  elif fieldName == "resourceFetchTimeMs":
    fieldName = "resource_fetch_time_ms"
  elif fieldName == "resource_fetch_time_ms":
    fieldName = "resourceFetchTimeMs"
  elif fieldName == "serverResponseTimeMs":
    fieldName = "server_response_time_ms"
  elif fieldName == "server_response_time_ms":
    fieldName = "serverResponseTimeMs"

proc renameHook*(v: DigitalExperienceMonitoringHttpDetailsResponse, fieldName: var string) {.inline.} =
  if fieldName == "httpStats":
    fieldName = "http_stats"
  elif fieldName == "http_stats":
    fieldName = "httpStats"
  elif fieldName == "httpStatsByColo":
    fieldName = "http_stats_by_colo"
  elif fieldName == "http_stats_by_colo":
    fieldName = "httpStatsByColo"

proc renameHook*(v: DigitalExperienceMonitoringLiveStat, fieldName: var string) {.inline.} =
  if fieldName == "uniqueDevicesTotal":
    fieldName = "unique_devices_total"
  elif fieldName == "unique_devices_total":
    fieldName = "uniqueDevicesTotal"

proc renameHook*(v: DigitalExperienceMonitoringRttStats, fieldName: var string) {.inline.} =
  if fieldName == "minRttUs":
    fieldName = "min_rtt_us"
  elif fieldName == "min_rtt_us":
    fieldName = "minRttUs"
  elif fieldName == "rttUs":
    fieldName = "rtt_us"
  elif fieldName == "rtt_us":
    fieldName = "rttUs"
  elif fieldName == "rttVarUs":
    fieldName = "rtt_var_us"
  elif fieldName == "rtt_var_us":
    fieldName = "rttVarUs"

proc renameHook*(v: DigitalExperienceMonitoringSchemasAggregateStat, fieldName: var string) {.inline.} =
  if fieldName == "uniqueDevicesTotal":
    fieldName = "unique_devices_total"
  elif fieldName == "unique_devices_total":
    fieldName = "uniqueDevicesTotal"

proc renameHook*(v: DigitalExperienceMonitoringTestsResponse, fieldName: var string) {.inline.} =
  if fieldName == "overviewMetrics":
    fieldName = "overview_metrics"
  elif fieldName == "overview_metrics":
    fieldName = "overviewMetrics"

proc renameHook*(v: DigitalExperienceMonitoringTimingAggregates, fieldName: var string) {.inline.} =
  if fieldName == "avgMs":
    fieldName = "avg_ms"
  elif fieldName == "avg_ms":
    fieldName = "avgMs"
  elif fieldName == "overTime":
    fieldName = "over_time"
  elif fieldName == "over_time":
    fieldName = "overTime"

proc renameHook*(v: DigitalExperienceMonitoringTracerouteDetailsPercentilesResponse, fieldName: var string) {.inline.} =
  if fieldName == "hopsCount":
    fieldName = "hops_count"
  elif fieldName == "hops_count":
    fieldName = "hopsCount"
  elif fieldName == "packetLossPct":
    fieldName = "packet_loss_pct"
  elif fieldName == "packet_loss_pct":
    fieldName = "packetLossPct"
  elif fieldName == "roundTripTimeMs":
    fieldName = "round_trip_time_ms"
  elif fieldName == "round_trip_time_ms":
    fieldName = "roundTripTimeMs"

proc renameHook*(v: DigitalExperienceMonitoringTracerouteDetailsResponse, fieldName: var string) {.inline.} =
  if fieldName == "tracerouteStats":
    fieldName = "traceroute_stats"
  elif fieldName == "traceroute_stats":
    fieldName = "tracerouteStats"
  elif fieldName == "tracerouteStatsByColo":
    fieldName = "traceroute_stats_by_colo"
  elif fieldName == "traceroute_stats_by_colo":
    fieldName = "tracerouteStatsByColo"

proc renameHook*(v: DigitalExperienceMonitoringTracerouteTestNetworkPathResponse, fieldName: var string) {.inline.} =
  if fieldName == "deviceName":
    fieldName = "device_name"
  elif fieldName == "device_name":
    fieldName = "deviceName"
  elif fieldName == "networkPath":
    fieldName = "network_path"
  elif fieldName == "network_path":
    fieldName = "networkPath"

proc renameHook*(v: DigitalExperienceMonitoringTracerouteTestResultNetworkPathResponse, fieldName: var string) {.inline.} =
  if fieldName == "deviceName":
    fieldName = "device_name"
  elif fieldName == "device_name":
    fieldName = "deviceName"
  elif fieldName == "resultId":
    fieldName = "result_id"
  elif fieldName == "result_id":
    fieldName = "resultId"
  elif fieldName == "testId":
    fieldName = "test_id"
  elif fieldName == "test_id":
    fieldName = "testId"
  elif fieldName == "testName":
    fieldName = "test_name"
  elif fieldName == "test_name":
    fieldName = "testName"

proc renameHook*(v: DigitalExperienceMonitoringTunnelStats, fieldName: var string) {.inline.} =
  if fieldName == "bytesLost":
    fieldName = "bytes_lost"
  elif fieldName == "bytes_lost":
    fieldName = "bytesLost"
  elif fieldName == "bytesReceived":
    fieldName = "bytes_received"
  elif fieldName == "bytes_received":
    fieldName = "bytesReceived"
  elif fieldName == "bytesRetransmitted":
    fieldName = "bytes_retransmitted"
  elif fieldName == "bytes_retransmitted":
    fieldName = "bytesRetransmitted"
  elif fieldName == "bytesSent":
    fieldName = "bytes_sent"
  elif fieldName == "bytes_sent":
    fieldName = "bytesSent"
  elif fieldName == "packetsLost":
    fieldName = "packets_lost"
  elif fieldName == "packets_lost":
    fieldName = "packetsLost"
  elif fieldName == "packetsReceived":
    fieldName = "packets_received"
  elif fieldName == "packets_received":
    fieldName = "packetsReceived"
  elif fieldName == "packetsRetransmitted":
    fieldName = "packets_retransmitted"
  elif fieldName == "packets_retransmitted":
    fieldName = "packetsRetransmitted"
  elif fieldName == "packetsSent":
    fieldName = "packets_sent"
  elif fieldName == "packets_sent":
    fieldName = "packetsSent"
  elif fieldName == "statsWindowMs":
    fieldName = "stats_window_ms"
  elif fieldName == "stats_window_ms":
    fieldName = "statsWindowMs"

proc renameHook*(v: DigitalExperienceMonitoringUniqueDevicesResponse, fieldName: var string) {.inline.} =
  if fieldName == "uniqueDevicesTotal":
    fieldName = "unique_devices_total"
  elif fieldName == "unique_devices_total":
    fieldName = "uniqueDevicesTotal"

proc renameHook*(v: DnssecDnskeyRecord, fieldName: var string) {.inline.} =
  if fieldName == "Algorithm":
    fieldName = "algorithm"
  elif fieldName == "algorithm":
    fieldName = "Algorithm"
  elif fieldName == "Flags":
    fieldName = "flags"
  elif fieldName == "flags":
    fieldName = "Flags"
  elif fieldName == "Hdr":
    fieldName = "hdr"
  elif fieldName == "hdr":
    fieldName = "Hdr"
  elif fieldName == "Protocol":
    fieldName = "protocol"
  elif fieldName == "protocol":
    fieldName = "Protocol"
  elif fieldName == "PublicKey":
    fieldName = "public_key"
  elif fieldName == "public_key":
    fieldName = "PublicKey"

proc renameHook*(v: DnssecDnskeyRecordHeader, fieldName: var string) {.inline.} =
  if fieldName == "Class":
    fieldName = "class"
  elif fieldName == "class":
    fieldName = "Class"
  elif fieldName == "Name":
    fieldName = "name"
  elif fieldName == "name":
    fieldName = "Name"
  elif fieldName == "Rdlength":
    fieldName = "rdlength"
  elif fieldName == "rdlength":
    fieldName = "Rdlength"
  elif fieldName == "Rrtype":
    fieldName = "rrtype"
  elif fieldName == "rrtype":
    fieldName = "Rrtype"
  elif fieldName == "Ttl":
    fieldName = "ttl"
  elif fieldName == "ttl":
    fieldName = "Ttl"

proc renameHook*(v: DnssecDnssecZsk, fieldName: var string) {.inline.} =
  if fieldName == "DNSKEY":
    fieldName = "d_n_s_k_e_y"
  elif fieldName == "d_n_s_k_e_y":
    fieldName = "DNSKEY"
  elif fieldName == "Location":
    fieldName = "location"
  elif fieldName == "location":
    fieldName = "Location"
  elif fieldName == "Name":
    fieldName = "name"
  elif fieldName == "name":
    fieldName = "Name"
  elif fieldName == "SigningKey":
    fieldName = "signing_key"
  elif fieldName == "signing_key":
    fieldName = "SigningKey"
  elif fieldName == "Tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "Tag"

proc renameHook*(v: FirewallFilters, fieldName: var string) {.inline.} =
  if fieldName == "configuration.target":
    fieldName = "configuration_target"
  elif fieldName == "configuration_target":
    fieldName = "configuration.target"
  elif fieldName == "configuration.value":
    fieldName = "configuration_value"
  elif fieldName == "configuration_value":
    fieldName = "configuration.value"

proc renameHook*(v: FlagshipEvaluationResult, fieldName: var string) {.inline.} =
  if fieldName == "flagKey":
    fieldName = "flag_key"
  elif fieldName == "flag_key":
    fieldName = "flagKey"

proc renameHook*(v: GoogleTagGatewayGoogleTagGatewayConfig, fieldName: var string) {.inline.} =
  if fieldName == "hideOriginalIp":
    fieldName = "hide_original_ip"
  elif fieldName == "hide_original_ip":
    fieldName = "hideOriginalIp"
  elif fieldName == "measurementId":
    fieldName = "measurement_id"
  elif fieldName == "measurement_id":
    fieldName = "measurementId"
  elif fieldName == "setUpTag":
    fieldName = "set_up_tag"
  elif fieldName == "set_up_tag":
    fieldName = "setUpTag"

proc renameHook*(v: IamScimAuthenticationScheme, fieldName: var string) {.inline.} =
  if fieldName == "documentationUri":
    fieldName = "documentation_uri"
  elif fieldName == "documentation_uri":
    fieldName = "documentationUri"
  elif fieldName == "specUri":
    fieldName = "spec_uri"
  elif fieldName == "spec_uri":
    fieldName = "specUri"

proc renameHook*(v: IamScimBulkFeature, fieldName: var string) {.inline.} =
  if fieldName == "maxOperations":
    fieldName = "max_operations"
  elif fieldName == "max_operations":
    fieldName = "maxOperations"
  elif fieldName == "maxPayloadSize":
    fieldName = "max_payload_size"
  elif fieldName == "max_payload_size":
    fieldName = "maxPayloadSize"

proc renameHook*(v: IamScimErrorResponse, fieldName: var string) {.inline.} =
  if fieldName == "scimType":
    fieldName = "scim_type"
  elif fieldName == "scim_type":
    fieldName = "scimType"

proc renameHook*(v: IamScimFilterFeature, fieldName: var string) {.inline.} =
  if fieldName == "maxResults":
    fieldName = "max_results"
  elif fieldName == "max_results":
    fieldName = "maxResults"

proc renameHook*(v: IamScimGroup, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"

proc renameHook*(v: IamScimGroupCreateRequest, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"

proc renameHook*(v: IamScimGroupListResponse, fieldName: var string) {.inline.} =
  if fieldName == "Resources":
    fieldName = "resources"
  elif fieldName == "resources":
    fieldName = "Resources"
  elif fieldName == "itemsPerPage":
    fieldName = "items_per_page"
  elif fieldName == "items_per_page":
    fieldName = "itemsPerPage"
  elif fieldName == "startIndex":
    fieldName = "start_index"
  elif fieldName == "start_index":
    fieldName = "startIndex"
  elif fieldName == "totalResults":
    fieldName = "total_results"
  elif fieldName == "total_results":
    fieldName = "totalResults"

proc renameHook*(v: IamScimGroupMeta, fieldName: var string) {.inline.} =
  if fieldName == "resourceType":
    fieldName = "resource_type"
  elif fieldName == "resource_type":
    fieldName = "resourceType"

proc renameHook*(v: IamScimGroupPatchOpRequest, fieldName: var string) {.inline.} =
  if fieldName == "Operations":
    fieldName = "operations"
  elif fieldName == "operations":
    fieldName = "Operations"

proc renameHook*(v: IamScimGroupSummary, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"

proc renameHook*(v: IamScimPatchOpRequest, fieldName: var string) {.inline.} =
  if fieldName == "Operations":
    fieldName = "operations"
  elif fieldName == "operations":
    fieldName = "Operations"

proc renameHook*(v: IamScimResourceType, fieldName: var string) {.inline.} =
  if fieldName == "schemaExtensions":
    fieldName = "schema_extensions"
  elif fieldName == "schema_extensions":
    fieldName = "schemaExtensions"

proc renameHook*(v: IamScimResourceTypeListResponse, fieldName: var string) {.inline.} =
  if fieldName == "Resources":
    fieldName = "resources"
  elif fieldName == "resources":
    fieldName = "Resources"
  elif fieldName == "itemsPerPage":
    fieldName = "items_per_page"
  elif fieldName == "items_per_page":
    fieldName = "itemsPerPage"
  elif fieldName == "startIndex":
    fieldName = "start_index"
  elif fieldName == "start_index":
    fieldName = "startIndex"
  elif fieldName == "totalResults":
    fieldName = "total_results"
  elif fieldName == "total_results":
    fieldName = "totalResults"

proc renameHook*(v: IamScimResourceTypeMeta, fieldName: var string) {.inline.} =
  if fieldName == "resourceType":
    fieldName = "resource_type"
  elif fieldName == "resource_type":
    fieldName = "resourceType"

proc renameHook*(v: IamScimSchemaAttr, fieldName: var string) {.inline.} =
  if fieldName == "canonicalValues":
    fieldName = "canonical_values"
  elif fieldName == "canonical_values":
    fieldName = "canonicalValues"
  elif fieldName == "caseExact":
    fieldName = "case_exact"
  elif fieldName == "case_exact":
    fieldName = "caseExact"
  elif fieldName == "multiValued":
    fieldName = "multi_valued"
  elif fieldName == "multi_valued":
    fieldName = "multiValued"
  elif fieldName == "referenceTypes":
    fieldName = "reference_types"
  elif fieldName == "reference_types":
    fieldName = "referenceTypes"
  elif fieldName == "subAttributes":
    fieldName = "sub_attributes"
  elif fieldName == "sub_attributes":
    fieldName = "subAttributes"

proc renameHook*(v: IamScimSchemaListResponse, fieldName: var string) {.inline.} =
  if fieldName == "Resources":
    fieldName = "resources"
  elif fieldName == "resources":
    fieldName = "Resources"
  elif fieldName == "itemsPerPage":
    fieldName = "items_per_page"
  elif fieldName == "items_per_page":
    fieldName = "itemsPerPage"
  elif fieldName == "startIndex":
    fieldName = "start_index"
  elif fieldName == "start_index":
    fieldName = "startIndex"
  elif fieldName == "totalResults":
    fieldName = "total_results"
  elif fieldName == "total_results":
    fieldName = "totalResults"

proc renameHook*(v: IamScimSchemaMeta, fieldName: var string) {.inline.} =
  if fieldName == "resourceType":
    fieldName = "resource_type"
  elif fieldName == "resource_type":
    fieldName = "resourceType"

proc renameHook*(v: IamScimServiceProviderConfig, fieldName: var string) {.inline.} =
  if fieldName == "authenticationSchemes":
    fieldName = "authentication_schemes"
  elif fieldName == "authentication_schemes":
    fieldName = "authenticationSchemes"
  elif fieldName == "changePassword":
    fieldName = "change_password"
  elif fieldName == "change_password":
    fieldName = "changePassword"
  elif fieldName == "documentationUri":
    fieldName = "documentation_uri"
  elif fieldName == "documentation_uri":
    fieldName = "documentationUri"

proc renameHook*(v: IamScimUser, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"
  elif fieldName == "userName":
    fieldName = "user_name"
  elif fieldName == "user_name":
    fieldName = "userName"

proc renameHook*(v: IamScimUserCreateRequest, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"
  elif fieldName == "userName":
    fieldName = "user_name"
  elif fieldName == "user_name":
    fieldName = "userName"

proc renameHook*(v: IamScimUserListResponse, fieldName: var string) {.inline.} =
  if fieldName == "Resources":
    fieldName = "resources"
  elif fieldName == "resources":
    fieldName = "Resources"
  elif fieldName == "itemsPerPage":
    fieldName = "items_per_page"
  elif fieldName == "items_per_page":
    fieldName = "itemsPerPage"
  elif fieldName == "startIndex":
    fieldName = "start_index"
  elif fieldName == "start_index":
    fieldName = "startIndex"
  elif fieldName == "totalResults":
    fieldName = "total_results"
  elif fieldName == "total_results":
    fieldName = "totalResults"

proc renameHook*(v: IamScimUserNameObject, fieldName: var string) {.inline.} =
  if fieldName == "familyName":
    fieldName = "family_name"
  elif fieldName == "family_name":
    fieldName = "familyName"
  elif fieldName == "givenName":
    fieldName = "given_name"
  elif fieldName == "given_name":
    fieldName = "givenName"

proc renameHook*(v: IamScimUserReplaceRequest, fieldName: var string) {.inline.} =
  if fieldName == "displayName":
    fieldName = "display_name"
  elif fieldName == "display_name":
    fieldName = "displayName"
  elif fieldName == "externalId":
    fieldName = "external_id"
  elif fieldName == "external_id":
    fieldName = "externalId"
  elif fieldName == "userName":
    fieldName = "user_name"
  elif fieldName == "user_name":
    fieldName = "userName"

proc renameHook*(v: ImagesImage, fieldName: var string) {.inline.} =
  if fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"

proc renameHook*(v: ImagesImageBasicUpload, fieldName: var string) {.inline.} =
  if fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"

proc renameHook*(v: ImagesImageDirectUploadRequestV2, fieldName: var string) {.inline.} =
  if fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"

proc renameHook*(v: ImagesImagePatchRequest, fieldName: var string) {.inline.} =
  if fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"

proc renameHook*(v: ImagesImageVariantDefinition, fieldName: var string) {.inline.} =
  if fieldName == "neverRequireSignedURLs":
    fieldName = "never_require_signed_u_r_ls"
  elif fieldName == "never_require_signed_u_r_ls":
    fieldName = "neverRequireSignedURLs"

proc renameHook*(v: ImagesImageVariantPatchRequest, fieldName: var string) {.inline.} =
  if fieldName == "neverRequireSignedURLs":
    fieldName = "never_require_signed_u_r_ls"
  elif fieldName == "never_require_signed_u_r_ls":
    fieldName = "neverRequireSignedURLs"

proc renameHook*(v: ImagesSourcingkitMigration, fieldName: var string) {.inline.} =
  if fieldName == "conflictBehaviour":
    fieldName = "conflict_behaviour"
  elif fieldName == "conflict_behaviour":
    fieldName = "conflictBehaviour"
  elif fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "endedAt":
    fieldName = "ended_at"
  elif fieldName == "ended_at":
    fieldName = "endedAt"
  elif fieldName == "excludedContentTypes":
    fieldName = "excluded_content_types"
  elif fieldName == "excluded_content_types":
    fieldName = "excludedContentTypes"
  elif fieldName == "imagesPathPrefix":
    fieldName = "images_path_prefix"
  elif fieldName == "images_path_prefix":
    fieldName = "imagesPathPrefix"
  elif fieldName == "logStopped":
    fieldName = "log_stopped"
  elif fieldName == "log_stopped":
    fieldName = "logStopped"
  elif fieldName == "pathPrefix":
    fieldName = "path_prefix"
  elif fieldName == "path_prefix":
    fieldName = "pathPrefix"
  elif fieldName == "rootDirectory":
    fieldName = "root_directory"
  elif fieldName == "root_directory":
    fieldName = "rootDirectory"
  elif fieldName == "sourceId":
    fieldName = "source_id"
  elif fieldName == "source_id":
    fieldName = "sourceId"
  elif fieldName == "startedAt":
    fieldName = "started_at"
  elif fieldName == "started_at":
    fieldName = "startedAt"

proc renameHook*(v: ImagesSourcingkitMigrationCreateRequest, fieldName: var string) {.inline.} =
  if fieldName == "conflictBehaviour":
    fieldName = "conflict_behaviour"
  elif fieldName == "conflict_behaviour":
    fieldName = "conflictBehaviour"
  elif fieldName == "excludedContentTypes":
    fieldName = "excluded_content_types"
  elif fieldName == "excluded_content_types":
    fieldName = "excludedContentTypes"
  elif fieldName == "pathPrefix":
    fieldName = "path_prefix"
  elif fieldName == "path_prefix":
    fieldName = "pathPrefix"
  elif fieldName == "rootDirectory":
    fieldName = "root_directory"
  elif fieldName == "root_directory":
    fieldName = "rootDirectory"
  elif fieldName == "sourceId":
    fieldName = "source_id"
  elif fieldName == "source_id":
    fieldName = "sourceId"

proc renameHook*(v: ImagesSourcingkitMigrationLog, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "logType":
    fieldName = "log_type"
  elif fieldName == "log_type":
    fieldName = "logType"

proc renameHook*(v: ImagesSourcingkitSource, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "updatedAt":
    fieldName = "updated_at"
  elif fieldName == "updated_at":
    fieldName = "updatedAt"

proc renameHook*(v: LoadBalancingSchemasHeader, fieldName: var string) {.inline.} =
  if fieldName == "Host":
    fieldName = "host"
  elif fieldName == "host":
    fieldName = "Host"

proc renameHook*(v: LogpushOutputOptions, fieldName: var string) {.inline.} =
  if fieldName == "CVE-2021-44228":
    fieldName = "c_v_e_2021_44228"
  elif fieldName == "c_v_e_2021_44228":
    fieldName = "CVE-2021-44228"

proc renameHook*(v: MagicBgpRedistributeSources, fieldName: var string) {.inline.} =
  if fieldName == "static:wan":
    fieldName = "static_wan"
  elif fieldName == "static_wan":
    fieldName = "static:wan"

proc renameHook*(v: MagicUpdateBgpSettingsRedistributeSources, fieldName: var string) {.inline.} =
  if fieldName == "static:wan":
    fieldName = "static_wan"
  elif fieldName == "static_wan":
    fieldName = "static:wan"

proc renameHook*(v: McnResourceDetailsSectionItem, fieldName: var string) {.inline.} =
  if fieldName == "helpText":
    fieldName = "help_text"
  elif fieldName == "help_text":
    fieldName = "helpText"

proc renameHook*(v: ObservatoryAvailabilities, fieldName: var string) {.inline.} =
  if fieldName == "regionsPerPlan":
    fieldName = "regions_per_plan"
  elif fieldName == "regions_per_plan":
    fieldName = "regionsPerPlan"

proc renameHook*(v: ObservatoryLighthouseReport, fieldName: var string) {.inline.} =
  if fieldName == "deviceType":
    fieldName = "device_type"
  elif fieldName == "device_type":
    fieldName = "deviceType"
  elif fieldName == "jsonReportUrl":
    fieldName = "json_report_url"
  elif fieldName == "json_report_url":
    fieldName = "jsonReportUrl"
  elif fieldName == "performanceScore":
    fieldName = "performance_score"
  elif fieldName == "performance_score":
    fieldName = "performanceScore"

proc renameHook*(v: ObservatoryPageTest, fieldName: var string) {.inline.} =
  if fieldName == "desktopReport":
    fieldName = "desktop_report"
  elif fieldName == "desktop_report":
    fieldName = "desktopReport"
  elif fieldName == "mobileReport":
    fieldName = "mobile_report"
  elif fieldName == "mobile_report":
    fieldName = "mobileReport"
  elif fieldName == "scheduleFrequency":
    fieldName = "schedule_frequency"
  elif fieldName == "schedule_frequency":
    fieldName = "scheduleFrequency"

proc renameHook*(v: ObservatoryTrend, fieldName: var string) {.inline.} =
  if fieldName == "performanceScore":
    fieldName = "performance_score"
  elif fieldName == "performance_score":
    fieldName = "performanceScore"

proc renameHook*(v: R2SlurperConnectivityResponse, fieldName: var string) {.inline.} =
  if fieldName == "connectivityStatus":
    fieldName = "connectivity_status"
  elif fieldName == "connectivity_status":
    fieldName = "connectivityStatus"

proc renameHook*(v: R2SlurperGCSLikeCredsSchema, fieldName: var string) {.inline.} =
  if fieldName == "clientEmail":
    fieldName = "client_email"
  elif fieldName == "client_email":
    fieldName = "clientEmail"
  elif fieldName == "privateKey":
    fieldName = "private_key"
  elif fieldName == "private_key":
    fieldName = "privateKey"

proc renameHook*(v: R2SlurperGCSSourceSchema, fieldName: var string) {.inline.} =
  if fieldName == "pathPrefix":
    fieldName = "path_prefix"
  elif fieldName == "path_prefix":
    fieldName = "pathPrefix"

proc renameHook*(v: R2SlurperJobLogResponse, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "logType":
    fieldName = "log_type"
  elif fieldName == "log_type":
    fieldName = "logType"
  elif fieldName == "objectKey":
    fieldName = "object_key"
  elif fieldName == "object_key":
    fieldName = "objectKey"

proc renameHook*(v: R2SlurperJobProgressResponse, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "failedObjects":
    fieldName = "failed_objects"
  elif fieldName == "failed_objects":
    fieldName = "failedObjects"
  elif fieldName == "skippedObjects":
    fieldName = "skipped_objects"
  elif fieldName == "skipped_objects":
    fieldName = "skippedObjects"
  elif fieldName == "transferredObjects":
    fieldName = "transferred_objects"
  elif fieldName == "transferred_objects":
    fieldName = "transferredObjects"

proc renameHook*(v: R2SlurperJobResponse, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "finishedAt":
    fieldName = "finished_at"
  elif fieldName == "finished_at":
    fieldName = "finishedAt"

proc renameHook*(v: R2SlurperR2SourceSchema, fieldName: var string) {.inline.} =
  if fieldName == "pathPrefix":
    fieldName = "path_prefix"
  elif fieldName == "path_prefix":
    fieldName = "pathPrefix"

proc renameHook*(v: R2SlurperS3LikeCredsSchema, fieldName: var string) {.inline.} =
  if fieldName == "accessKeyId":
    fieldName = "access_key_id"
  elif fieldName == "access_key_id":
    fieldName = "accessKeyId"
  elif fieldName == "secretAccessKey":
    fieldName = "secret_access_key"
  elif fieldName == "secret_access_key":
    fieldName = "secretAccessKey"

proc renameHook*(v: R2SlurperS3SourceSchema, fieldName: var string) {.inline.} =
  if fieldName == "pathPrefix":
    fieldName = "path_prefix"
  elif fieldName == "path_prefix":
    fieldName = "pathPrefix"

proc renameHook*(v: R2AccountLevelMetrics, fieldName: var string) {.inline.} =
  if fieldName == "infrequentAccess":
    fieldName = "infrequent_access"
  elif fieldName == "infrequent_access":
    fieldName = "infrequentAccess"

proc renameHook*(v: R2AddCustomDomainRequest, fieldName: var string) {.inline.} =
  if fieldName == "minTLS":
    fieldName = "min_t_l_s"
  elif fieldName == "min_t_l_s":
    fieldName = "minTLS"
  elif fieldName == "zoneId":
    fieldName = "zone_id"
  elif fieldName == "zone_id":
    fieldName = "zoneId"

proc renameHook*(v: R2AddCustomDomainResponse, fieldName: var string) {.inline.} =
  if fieldName == "minTLS":
    fieldName = "min_t_l_s"
  elif fieldName == "min_t_l_s":
    fieldName = "minTLS"
  elif fieldName == "zoneId":
    fieldName = "zone_id"
  elif fieldName == "zone_id":
    fieldName = "zoneId"

proc renameHook*(v: R2BucketConfig, fieldName: var string) {.inline.} =
  if fieldName == "bucketName":
    fieldName = "bucket_name"
  elif fieldName == "bucket_name":
    fieldName = "bucketName"

proc renameHook*(v: R2CorsRule, fieldName: var string) {.inline.} =
  if fieldName == "exposeHeaders":
    fieldName = "expose_headers"
  elif fieldName == "expose_headers":
    fieldName = "exposeHeaders"
  elif fieldName == "maxAgeSeconds":
    fieldName = "max_age_seconds"
  elif fieldName == "max_age_seconds":
    fieldName = "maxAgeSeconds"

proc renameHook*(v: R2EditCustomDomainRequest, fieldName: var string) {.inline.} =
  if fieldName == "minTLS":
    fieldName = "min_t_l_s"
  elif fieldName == "min_t_l_s":
    fieldName = "minTLS"

proc renameHook*(v: R2EditCustomDomainResponse, fieldName: var string) {.inline.} =
  if fieldName == "minTLS":
    fieldName = "min_t_l_s"
  elif fieldName == "min_t_l_s":
    fieldName = "minTLS"

proc renameHook*(v: R2GetCustomDomainResponse, fieldName: var string) {.inline.} =
  if fieldName == "minTLS":
    fieldName = "min_t_l_s"
  elif fieldName == "min_t_l_s":
    fieldName = "minTLS"
  elif fieldName == "zoneId":
    fieldName = "zone_id"
  elif fieldName == "zone_id":
    fieldName = "zoneId"
  elif fieldName == "zoneName":
    fieldName = "zone_name"
  elif fieldName == "zone_name":
    fieldName = "zoneName"

proc renameHook*(v: R2LifecycleAgeCondition, fieldName: var string) {.inline.} =
  if fieldName == "maxAge":
    fieldName = "max_age"
  elif fieldName == "max_age":
    fieldName = "maxAge"

proc renameHook*(v: R2LifecycleRule, fieldName: var string) {.inline.} =
  if fieldName == "abortMultipartUploadsTransition":
    fieldName = "abort_multipart_uploads_transition"
  elif fieldName == "abort_multipart_uploads_transition":
    fieldName = "abortMultipartUploadsTransition"
  elif fieldName == "deleteObjectsTransition":
    fieldName = "delete_objects_transition"
  elif fieldName == "delete_objects_transition":
    fieldName = "deleteObjectsTransition"
  elif fieldName == "storageClassTransitions":
    fieldName = "storage_class_transitions"
  elif fieldName == "storage_class_transitions":
    fieldName = "storageClassTransitions"

proc renameHook*(v: R2LifecycleStorageTransition, fieldName: var string) {.inline.} =
  if fieldName == "storageClass":
    fieldName = "storage_class"
  elif fieldName == "storage_class":
    fieldName = "storageClass"

proc renameHook*(v: R2LockRuleAgeCondition, fieldName: var string) {.inline.} =
  if fieldName == "maxAgeSeconds":
    fieldName = "max_age_seconds"
  elif fieldName == "max_age_seconds":
    fieldName = "maxAgeSeconds"

proc renameHook*(v: R2ManagedDomainResponse, fieldName: var string) {.inline.} =
  if fieldName == "bucketId":
    fieldName = "bucket_id"
  elif fieldName == "bucket_id":
    fieldName = "bucketId"

proc renameHook*(v: R2ObjectSizeMetrics, fieldName: var string) {.inline.} =
  if fieldName == "metadataSize":
    fieldName = "metadata_size"
  elif fieldName == "metadata_size":
    fieldName = "metadataSize"
  elif fieldName == "payloadSize":
    fieldName = "payload_size"
  elif fieldName == "payload_size":
    fieldName = "payloadSize"

proc renameHook*(v: R2QueuesConfig, fieldName: var string) {.inline.} =
  if fieldName == "queueId":
    fieldName = "queue_id"
  elif fieldName == "queue_id":
    fieldName = "queueId"
  elif fieldName == "queueName":
    fieldName = "queue_name"
  elif fieldName == "queue_name":
    fieldName = "queueName"

proc renameHook*(v: R2R2BucketJob, fieldName: var string) {.inline.} =
  if fieldName == "endTime":
    fieldName = "end_time"
  elif fieldName == "end_time":
    fieldName = "endTime"
  elif fieldName == "jobType":
    fieldName = "job_type"
  elif fieldName == "job_type":
    fieldName = "jobType"
  elif fieldName == "prefixDelete":
    fieldName = "prefix_delete"
  elif fieldName == "prefix_delete":
    fieldName = "prefixDelete"
  elif fieldName == "startTime":
    fieldName = "start_time"
  elif fieldName == "start_time":
    fieldName = "startTime"

proc renameHook*(v: R2R2BucketJobsResult, fieldName: var string) {.inline.} =
  if fieldName == "nextContinuationToken":
    fieldName = "next_continuation_token"
  elif fieldName == "next_continuation_token":
    fieldName = "nextContinuationToken"

proc renameHook*(v: R2R2ObjectHttpMetadata, fieldName: var string) {.inline.} =
  if fieldName == "cacheControl":
    fieldName = "cache_control"
  elif fieldName == "cache_control":
    fieldName = "cacheControl"
  elif fieldName == "cacheExpiry":
    fieldName = "cache_expiry"
  elif fieldName == "cache_expiry":
    fieldName = "cacheExpiry"
  elif fieldName == "contentDisposition":
    fieldName = "content_disposition"
  elif fieldName == "content_disposition":
    fieldName = "contentDisposition"
  elif fieldName == "contentEncoding":
    fieldName = "content_encoding"
  elif fieldName == "content_encoding":
    fieldName = "contentEncoding"
  elif fieldName == "contentLanguage":
    fieldName = "content_language"
  elif fieldName == "content_language":
    fieldName = "contentLanguage"
  elif fieldName == "contentType":
    fieldName = "content_type"
  elif fieldName == "content_type":
    fieldName = "contentType"

proc renameHook*(v: R2TempAccessCredsRequest, fieldName: var string) {.inline.} =
  if fieldName == "parentAccessKeyId":
    fieldName = "parent_access_key_id"
  elif fieldName == "parent_access_key_id":
    fieldName = "parentAccessKeyId"
  elif fieldName == "ttlSeconds":
    fieldName = "ttl_seconds"
  elif fieldName == "ttl_seconds":
    fieldName = "ttlSeconds"

proc renameHook*(v: R2TempAccessCredsResponse, fieldName: var string) {.inline.} =
  if fieldName == "accessKeyId":
    fieldName = "access_key_id"
  elif fieldName == "access_key_id":
    fieldName = "accessKeyId"
  elif fieldName == "secretAccessKey":
    fieldName = "secret_access_key"
  elif fieldName == "secret_access_key":
    fieldName = "secretAccessKey"
  elif fieldName == "sessionToken":
    fieldName = "session_token"
  elif fieldName == "session_token":
    fieldName = "sessionToken"

proc renameHook*(v: RealtimekitLatencyCumulative, fieldName: var string) {.inline.} =
  if fieldName == "100ms_or_greater_event_fraction":
    fieldName = "f100ms_or_greater_event_fraction"
  elif fieldName == "f100ms_or_greater_event_fraction":
    fieldName = "100ms_or_greater_event_fraction"
  elif fieldName == "250ms_or_greater_event_fraction":
    fieldName = "f250ms_or_greater_event_fraction"
  elif fieldName == "f250ms_or_greater_event_fraction":
    fieldName = "250ms_or_greater_event_fraction"
  elif fieldName == "500ms_or_greater_event_fraction":
    fieldName = "f500ms_or_greater_event_fraction"
  elif fieldName == "f500ms_or_greater_event_fraction":
    fieldName = "500ms_or_greater_event_fraction"

proc renameHook*(v: RealtimekitPacketLossCumulative, fieldName: var string) {.inline.} =
  if fieldName == "10_or_greater_event_fraction":
    fieldName = "f10_or_greater_event_fraction"
  elif fieldName == "f10_or_greater_event_fraction":
    fieldName = "10_or_greater_event_fraction"
  elif fieldName == "25_or_greater_event_fraction":
    fieldName = "f25_or_greater_event_fraction"
  elif fieldName == "f25_or_greater_event_fraction":
    fieldName = "25_or_greater_event_fraction"
  elif fieldName == "50_or_greater_event_fraction":
    fieldName = "f50_or_greater_event_fraction"
  elif fieldName == "f50_or_greater_event_fraction":
    fieldName = "50_or_greater_event_fraction"
  elif fieldName == "5_or_greater_event_fraction":
    fieldName = "f5_or_greater_event_fraction"
  elif fieldName == "f5_or_greater_event_fraction":
    fieldName = "5_or_greater_event_fraction"

proc renameHook*(v: RealtimekitTranscript, fieldName: var string) {.inline.} =
  if fieldName == "sessionId":
    fieldName = "session_id"
  elif fieldName == "session_id":
    fieldName = "sessionId"

proc renameHook*(v: RealtimekitTranscriptSummary, fieldName: var string) {.inline.} =
  if fieldName == "sessionId":
    fieldName = "session_id"
  elif fieldName == "session_id":
    fieldName = "sessionId"
  elif fieldName == "summaryDownloadUrl":
    fieldName = "summary_download_url"
  elif fieldName == "summary_download_url":
    fieldName = "summaryDownloadUrl"
  elif fieldName == "summaryDownloadUrlExpiry":
    fieldName = "summary_download_url_expiry"
  elif fieldName == "summary_download_url_expiry":
    fieldName = "summaryDownloadUrlExpiry"

proc renameHook*(v: StreamClipping, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "clippedFromVideoUID":
    fieldName = "clipped_from_video_u_i_d"
  elif fieldName == "clipped_from_video_u_i_d":
    fieldName = "clippedFromVideoUID"
  elif fieldName == "endTimeSeconds":
    fieldName = "end_time_seconds"
  elif fieldName == "end_time_seconds":
    fieldName = "endTimeSeconds"
  elif fieldName == "maxDurationSeconds":
    fieldName = "max_duration_seconds"
  elif fieldName == "max_duration_seconds":
    fieldName = "maxDurationSeconds"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "startTimeSeconds":
    fieldName = "start_time_seconds"
  elif fieldName == "start_time_seconds":
    fieldName = "startTimeSeconds"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"

proc renameHook*(v: StreamCreateInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "defaultCreator":
    fieldName = "default_creator"
  elif fieldName == "default_creator":
    fieldName = "defaultCreator"
  elif fieldName == "deleteRecordingAfterDays":
    fieldName = "delete_recording_after_days"
  elif fieldName == "delete_recording_after_days":
    fieldName = "deleteRecordingAfterDays"
  elif fieldName == "preferLowLatency":
    fieldName = "prefer_low_latency"
  elif fieldName == "prefer_low_latency":
    fieldName = "preferLowLatency"

proc renameHook*(v: StreamCreateOutputRequest, fieldName: var string) {.inline.} =
  if fieldName == "streamKey":
    fieldName = "stream_key"
  elif fieldName == "stream_key":
    fieldName = "streamKey"

proc renameHook*(v: StreamDirectUploadRequest, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "maxDurationSeconds":
    fieldName = "max_duration_seconds"
  elif fieldName == "max_duration_seconds":
    fieldName = "maxDurationSeconds"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "scheduledDeletion":
    fieldName = "scheduled_deletion"
  elif fieldName == "scheduled_deletion":
    fieldName = "scheduledDeletion"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"

proc renameHook*(v: StreamDownloads, fieldName: var string) {.inline.} =
  if fieldName == "percentComplete":
    fieldName = "percent_complete"
  elif fieldName == "percent_complete":
    fieldName = "percentComplete"

proc renameHook*(v: StreamInputRtmps, fieldName: var string) {.inline.} =
  if fieldName == "streamKey":
    fieldName = "stream_key"
  elif fieldName == "stream_key":
    fieldName = "streamKey"

proc renameHook*(v: StreamInputSrt, fieldName: var string) {.inline.} =
  if fieldName == "streamId":
    fieldName = "stream_id"
  elif fieldName == "stream_id":
    fieldName = "streamId"

proc renameHook*(v: StreamLiveInput2, fieldName: var string) {.inline.} =
  if fieldName == "deleteRecordingAfterDays":
    fieldName = "delete_recording_after_days"
  elif fieldName == "delete_recording_after_days":
    fieldName = "deleteRecordingAfterDays"
  elif fieldName == "keysRotatedAt":
    fieldName = "keys_rotated_at"
  elif fieldName == "keys_rotated_at":
    fieldName = "keysRotatedAt"
  elif fieldName == "preferLowLatency":
    fieldName = "prefer_low_latency"
  elif fieldName == "prefer_low_latency":
    fieldName = "preferLowLatency"
  elif fieldName == "rtmpsPlayback":
    fieldName = "rtmps_playback"
  elif fieldName == "rtmps_playback":
    fieldName = "rtmpsPlayback"
  elif fieldName == "srtPlayback":
    fieldName = "srt_playback"
  elif fieldName == "srt_playback":
    fieldName = "srtPlayback"
  elif fieldName == "webRTC":
    fieldName = "web_r_t_c"
  elif fieldName == "web_r_t_c":
    fieldName = "webRTC"
  elif fieldName == "webRTCPlayback":
    fieldName = "web_r_t_c_playback"
  elif fieldName == "web_r_t_c_playback":
    fieldName = "webRTCPlayback"

proc renameHook*(v: StreamLiveInputObjectWithoutUrl, fieldName: var string) {.inline.} =
  if fieldName == "deleteRecordingAfterDays":
    fieldName = "delete_recording_after_days"
  elif fieldName == "delete_recording_after_days":
    fieldName = "deleteRecordingAfterDays"

proc renameHook*(v: StreamLiveInputRecordingSettings, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "hideLiveViewerCount":
    fieldName = "hide_live_viewer_count"
  elif fieldName == "hide_live_viewer_count":
    fieldName = "hideLiveViewerCount"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "timeoutSeconds":
    fieldName = "timeout_seconds"
  elif fieldName == "timeout_seconds":
    fieldName = "timeoutSeconds"

proc renameHook*(v: StreamMediaStatus, fieldName: var string) {.inline.} =
  if fieldName == "errorReasonCode":
    fieldName = "error_reason_code"
  elif fieldName == "error_reason_code":
    fieldName = "errorReasonCode"
  elif fieldName == "errorReasonText":
    fieldName = "error_reason_text"
  elif fieldName == "error_reason_text":
    fieldName = "errorReasonText"
  elif fieldName == "pctComplete":
    fieldName = "pct_complete"
  elif fieldName == "pct_complete":
    fieldName = "pctComplete"

proc renameHook*(v: StreamOutput, fieldName: var string) {.inline.} =
  if fieldName == "streamKey":
    fieldName = "stream_key"
  elif fieldName == "stream_key":
    fieldName = "streamKey"

proc renameHook*(v: StreamPlaybackRtmps, fieldName: var string) {.inline.} =
  if fieldName == "streamKey":
    fieldName = "stream_key"
  elif fieldName == "stream_key":
    fieldName = "streamKey"

proc renameHook*(v: StreamPlaybackSrt, fieldName: var string) {.inline.} =
  if fieldName == "streamId":
    fieldName = "stream_id"
  elif fieldName == "stream_id":
    fieldName = "streamId"

proc renameHook*(v: StreamSignedTokenRequest, fieldName: var string) {.inline.} =
  if fieldName == "accessRules":
    fieldName = "access_rules"
  elif fieldName == "access_rules":
    fieldName = "accessRules"

proc renameHook*(v: StreamUpdateInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "defaultCreator":
    fieldName = "default_creator"
  elif fieldName == "default_creator":
    fieldName = "defaultCreator"
  elif fieldName == "deleteRecordingAfterDays":
    fieldName = "delete_recording_after_days"
  elif fieldName == "delete_recording_after_days":
    fieldName = "deleteRecordingAfterDays"
  elif fieldName == "preferLowLatency":
    fieldName = "prefer_low_latency"
  elif fieldName == "prefer_low_latency":
    fieldName = "preferLowLatency"

proc renameHook*(v: StreamVideoClipStandard, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "clippedFromVideoUID":
    fieldName = "clipped_from_video_u_i_d"
  elif fieldName == "clipped_from_video_u_i_d":
    fieldName = "clippedFromVideoUID"
  elif fieldName == "endTimeSeconds":
    fieldName = "end_time_seconds"
  elif fieldName == "end_time_seconds":
    fieldName = "endTimeSeconds"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "scheduledDeletion":
    fieldName = "scheduled_deletion"
  elif fieldName == "scheduled_deletion":
    fieldName = "scheduledDeletion"
  elif fieldName == "startTimeSeconds":
    fieldName = "start_time_seconds"
  elif fieldName == "start_time_seconds":
    fieldName = "startTimeSeconds"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"

proc renameHook*(v: StreamVideoCopyRequest, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "scheduledDeletion":
    fieldName = "scheduled_deletion"
  elif fieldName == "scheduled_deletion":
    fieldName = "scheduledDeletion"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"

proc renameHook*(v: StreamVideoUpdate, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "maxDurationSeconds":
    fieldName = "max_duration_seconds"
  elif fieldName == "max_duration_seconds":
    fieldName = "maxDurationSeconds"
  elif fieldName == "publicDetails":
    fieldName = "public_details"
  elif fieldName == "public_details":
    fieldName = "publicDetails"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "scheduledDeletion":
    fieldName = "scheduled_deletion"
  elif fieldName == "scheduled_deletion":
    fieldName = "scheduledDeletion"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"
  elif fieldName == "uploadExpiry":
    fieldName = "upload_expiry"
  elif fieldName == "upload_expiry":
    fieldName = "uploadExpiry"

proc renameHook*(v: StreamVideos, fieldName: var string) {.inline.} =
  if fieldName == "allowedOrigins":
    fieldName = "allowed_origins"
  elif fieldName == "allowed_origins":
    fieldName = "allowedOrigins"
  elif fieldName == "clippedFrom":
    fieldName = "clipped_from"
  elif fieldName == "clipped_from":
    fieldName = "clippedFrom"
  elif fieldName == "liveInput":
    fieldName = "live_input"
  elif fieldName == "live_input":
    fieldName = "liveInput"
  elif fieldName == "maxDurationSeconds":
    fieldName = "max_duration_seconds"
  elif fieldName == "max_duration_seconds":
    fieldName = "maxDurationSeconds"
  elif fieldName == "maxSizeBytes":
    fieldName = "max_size_bytes"
  elif fieldName == "max_size_bytes":
    fieldName = "maxSizeBytes"
  elif fieldName == "publicDetails":
    fieldName = "public_details"
  elif fieldName == "public_details":
    fieldName = "publicDetails"
  elif fieldName == "readyToStream":
    fieldName = "ready_to_stream"
  elif fieldName == "ready_to_stream":
    fieldName = "readyToStream"
  elif fieldName == "readyToStreamAt":
    fieldName = "ready_to_stream_at"
  elif fieldName == "ready_to_stream_at":
    fieldName = "readyToStreamAt"
  elif fieldName == "requireSignedURLs":
    fieldName = "require_signed_u_r_ls"
  elif fieldName == "require_signed_u_r_ls":
    fieldName = "requireSignedURLs"
  elif fieldName == "scheduledDeletion":
    fieldName = "scheduled_deletion"
  elif fieldName == "scheduled_deletion":
    fieldName = "scheduledDeletion"
  elif fieldName == "thumbnailTimestampPct":
    fieldName = "thumbnail_timestamp_pct"
  elif fieldName == "thumbnail_timestamp_pct":
    fieldName = "thumbnailTimestampPct"
  elif fieldName == "uploadExpiry":
    fieldName = "upload_expiry"
  elif fieldName == "upload_expiry":
    fieldName = "uploadExpiry"

proc renameHook*(v: StreamWatermarks, fieldName: var string) {.inline.} =
  if fieldName == "downloadedFrom":
    fieldName = "downloaded_from"
  elif fieldName == "downloaded_from":
    fieldName = "downloadedFrom"

proc renameHook*(v: StreamWebhookRequest, fieldName: var string) {.inline.} =
  if fieldName == "notificationUrl":
    fieldName = "notification_url"
  elif fieldName == "notification_url":
    fieldName = "notificationUrl"

proc renameHook*(v: TeamsDevicesCrowdstrikeInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "versionOperator":
    fieldName = "version_operator"
  elif fieldName == "version_operator":
    fieldName = "versionOperator"

proc renameHook*(v: TeamsDevicesDisableForTime, fieldName: var string) {.inline.} =
  if fieldName == "1":
    fieldName = "f1"
  elif fieldName == "f1":
    fieldName = "1"
  elif fieldName == "3":
    fieldName = "f3"
  elif fieldName == "f3":
    fieldName = "3"
  elif fieldName == "6":
    fieldName = "f6"
  elif fieldName == "f6":
    fieldName = "6"
  elif fieldName == "12":
    fieldName = "f12"
  elif fieldName == "f12":
    fieldName = "12"
  elif fieldName == "24":
    fieldName = "f24"
  elif fieldName == "f24":
    fieldName = "24"

proc renameHook*(v: TeamsDevicesDiskEncryptionInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "checkDisks":
    fieldName = "check_disks"
  elif fieldName == "check_disks":
    fieldName = "checkDisks"
  elif fieldName == "requireAll":
    fieldName = "require_all"
  elif fieldName == "require_all":
    fieldName = "requireAll"

proc renameHook*(v: TeamsDevicesKolideInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "countOperator":
    fieldName = "count_operator"
  elif fieldName == "count_operator":
    fieldName = "countOperator"

proc renameHook*(v: TeamsDevicesTaniumInputRequest, fieldName: var string) {.inline.} =
  if fieldName == "scoreOperator":
    fieldName = "score_operator"
  elif fieldName == "score_operator":
    fieldName = "scoreOperator"

proc renameHook*(v: TunnelConfig, fieldName: var string) {.inline.} =
  if fieldName == "originRequest":
    fieldName = "origin_request"
  elif fieldName == "origin_request":
    fieldName = "originRequest"
  elif fieldName == "warp-routing":
    fieldName = "warp_routing"
  elif fieldName == "warp_routing":
    fieldName = "warp-routing"

proc renameHook*(v: TunnelIngressRule, fieldName: var string) {.inline.} =
  if fieldName == "originRequest":
    fieldName = "origin_request"
  elif fieldName == "origin_request":
    fieldName = "originRequest"

proc renameHook*(v: TunnelOriginRequest, fieldName: var string) {.inline.} =
  if fieldName == "caPool":
    fieldName = "ca_pool"
  elif fieldName == "ca_pool":
    fieldName = "caPool"
  elif fieldName == "connectTimeout":
    fieldName = "connect_timeout"
  elif fieldName == "connect_timeout":
    fieldName = "connectTimeout"
  elif fieldName == "disableChunkedEncoding":
    fieldName = "disable_chunked_encoding"
  elif fieldName == "disable_chunked_encoding":
    fieldName = "disableChunkedEncoding"
  elif fieldName == "http2Origin":
    fieldName = "http2_origin"
  elif fieldName == "http2_origin":
    fieldName = "http2Origin"
  elif fieldName == "httpHostHeader":
    fieldName = "http_host_header"
  elif fieldName == "http_host_header":
    fieldName = "httpHostHeader"
  elif fieldName == "keepAliveConnections":
    fieldName = "keep_alive_connections"
  elif fieldName == "keep_alive_connections":
    fieldName = "keepAliveConnections"
  elif fieldName == "keepAliveTimeout":
    fieldName = "keep_alive_timeout"
  elif fieldName == "keep_alive_timeout":
    fieldName = "keepAliveTimeout"
  elif fieldName == "matchSNItoHost":
    fieldName = "match_s_n_ito_host"
  elif fieldName == "match_s_n_ito_host":
    fieldName = "matchSNItoHost"
  elif fieldName == "noHappyEyeballs":
    fieldName = "no_happy_eyeballs"
  elif fieldName == "no_happy_eyeballs":
    fieldName = "noHappyEyeballs"
  elif fieldName == "noTLSVerify":
    fieldName = "no_t_l_s_verify"
  elif fieldName == "no_t_l_s_verify":
    fieldName = "noTLSVerify"
  elif fieldName == "originServerName":
    fieldName = "origin_server_name"
  elif fieldName == "origin_server_name":
    fieldName = "originServerName"
  elif fieldName == "proxyType":
    fieldName = "proxy_type"
  elif fieldName == "proxy_type":
    fieldName = "proxyType"
  elif fieldName == "tcpKeepAlive":
    fieldName = "tcp_keep_alive"
  elif fieldName == "tcp_keep_alive":
    fieldName = "tcpKeepAlive"
  elif fieldName == "tlsTimeout":
    fieldName = "tls_timeout"
  elif fieldName == "tls_timeout":
    fieldName = "tlsTimeout"

proc renameHook*(v: UsageAnalyticsBillingUsageDataPoint, fieldName: var string) {.inline.} =
  if fieldName == "argoAcceleratedBytes":
    fieldName = "argo_accelerated_bytes"
  elif fieldName == "argo_accelerated_bytes":
    fieldName = "argoAcceleratedBytes"
  elif fieldName == "imageResizingRequests":
    fieldName = "image_resizing_requests"
  elif fieldName == "image_resizing_requests":
    fieldName = "imageResizingRequests"
  elif fieldName == "loadBalancingQueries":
    fieldName = "load_balancing_queries"
  elif fieldName == "load_balancing_queries":
    fieldName = "loadBalancingQueries"
  elif fieldName == "mediaUniqueTransformations":
    fieldName = "media_unique_transformations"
  elif fieldName == "media_unique_transformations":
    fieldName = "mediaUniqueTransformations"
  elif fieldName == "rateLimitingRequestsAllowed":
    fieldName = "rate_limiting_requests_allowed"
  elif fieldName == "rate_limiting_requests_allowed":
    fieldName = "rateLimitingRequestsAllowed"
  elif fieldName == "spectrumBytesTransferred":
    fieldName = "spectrum_bytes_transferred"
  elif fieldName == "spectrum_bytes_transferred":
    fieldName = "spectrumBytesTransferred"
  elif fieldName == "streamMinutesViewed":
    fieldName = "stream_minutes_viewed"
  elif fieldName == "stream_minutes_viewed":
    fieldName = "streamMinutesViewed"
  elif fieldName == "workersKVReads":
    fieldName = "workers_k_v_reads"
  elif fieldName == "workers_k_v_reads":
    fieldName = "workersKVReads"
  elif fieldName == "workersRequests":
    fieldName = "workers_requests"
  elif fieldName == "workers_requests":
    fieldName = "workersRequests"

proc renameHook*(v: UsageAnalyticsStreamUsageDataPoint, fieldName: var string) {.inline.} =
  if fieldName == "streamMinutesViewed":
    fieldName = "stream_minutes_viewed"
  elif fieldName == "stream_minutes_viewed":
    fieldName = "streamMinutesViewed"

proc renameHook*(v: VectorizeCreateMetadataIndexRequest, fieldName: var string) {.inline.} =
  if fieldName == "indexType":
    fieldName = "index_type"
  elif fieldName == "index_type":
    fieldName = "indexType"
  elif fieldName == "propertyName":
    fieldName = "property_name"
  elif fieldName == "property_name":
    fieldName = "propertyName"

proc renameHook*(v: VectorizeCreateMetadataIndexResponse, fieldName: var string) {.inline.} =
  if fieldName == "mutationId":
    fieldName = "mutation_id"
  elif fieldName == "mutation_id":
    fieldName = "mutationId"

proc renameHook*(v: VectorizeDeleteMetadataIndexRequest, fieldName: var string) {.inline.} =
  if fieldName == "propertyName":
    fieldName = "property_name"
  elif fieldName == "property_name":
    fieldName = "propertyName"

proc renameHook*(v: VectorizeDeleteMetadataIndexResponse, fieldName: var string) {.inline.} =
  if fieldName == "mutationId":
    fieldName = "mutation_id"
  elif fieldName == "mutation_id":
    fieldName = "mutationId"

proc renameHook*(v: VectorizeIndexDeleteVectorsByIdV2Response, fieldName: var string) {.inline.} =
  if fieldName == "mutationId":
    fieldName = "mutation_id"
  elif fieldName == "mutation_id":
    fieldName = "mutationId"

proc renameHook*(v: VectorizeIndexInfoResponse, fieldName: var string) {.inline.} =
  if fieldName == "processedUpToDatetime":
    fieldName = "processed_up_to_datetime"
  elif fieldName == "processed_up_to_datetime":
    fieldName = "processedUpToDatetime"
  elif fieldName == "processedUpToMutation":
    fieldName = "processed_up_to_mutation"
  elif fieldName == "processed_up_to_mutation":
    fieldName = "processedUpToMutation"
  elif fieldName == "vectorCount":
    fieldName = "vector_count"
  elif fieldName == "vector_count":
    fieldName = "vectorCount"

proc renameHook*(v: VectorizeIndexInsertV2Response, fieldName: var string) {.inline.} =
  if fieldName == "mutationId":
    fieldName = "mutation_id"
  elif fieldName == "mutation_id":
    fieldName = "mutationId"

proc renameHook*(v: VectorizeIndexListVectorsResponse, fieldName: var string) {.inline.} =
  if fieldName == "cursorExpirationTimestamp":
    fieldName = "cursor_expiration_timestamp"
  elif fieldName == "cursor_expiration_timestamp":
    fieldName = "cursorExpirationTimestamp"
  elif fieldName == "isTruncated":
    fieldName = "is_truncated"
  elif fieldName == "is_truncated":
    fieldName = "isTruncated"
  elif fieldName == "nextCursor":
    fieldName = "next_cursor"
  elif fieldName == "next_cursor":
    fieldName = "nextCursor"
  elif fieldName == "totalCount":
    fieldName = "total_count"
  elif fieldName == "total_count":
    fieldName = "totalCount"

proc renameHook*(v: VectorizeIndexQueryRequest, fieldName: var string) {.inline.} =
  if fieldName == "returnMetadata":
    fieldName = "return_metadata"
  elif fieldName == "return_metadata":
    fieldName = "returnMetadata"
  elif fieldName == "returnValues":
    fieldName = "return_values"
  elif fieldName == "return_values":
    fieldName = "returnValues"
  elif fieldName == "topK":
    fieldName = "top_k"
  elif fieldName == "top_k":
    fieldName = "topK"

proc renameHook*(v: VectorizeIndexQueryV2Request, fieldName: var string) {.inline.} =
  if fieldName == "returnMetadata":
    fieldName = "return_metadata"
  elif fieldName == "return_metadata":
    fieldName = "returnMetadata"
  elif fieldName == "returnValues":
    fieldName = "return_values"
  elif fieldName == "return_values":
    fieldName = "returnValues"
  elif fieldName == "topK":
    fieldName = "top_k"
  elif fieldName == "top_k":
    fieldName = "topK"

proc renameHook*(v: VectorizeIndexUpsertV2Response, fieldName: var string) {.inline.} =
  if fieldName == "mutationId":
    fieldName = "mutation_id"
  elif fieldName == "mutation_id":
    fieldName = "mutationId"

proc renameHook*(v: VectorizeListMetadataIndexResponse, fieldName: var string) {.inline.} =
  if fieldName == "metadataIndexes":
    fieldName = "metadata_indexes"
  elif fieldName == "metadata_indexes":
    fieldName = "metadataIndexes"

proc renameHook*(v: WorkersObservabilityDistributionResult, fieldName: var string) {.inline.} =
  if fieldName == "bucketBoundaries":
    fieldName = "bucket_boundaries"
  elif fieldName == "bucket_boundaries":
    fieldName = "bucketBoundaries"
  elif fieldName == "bucketMode":
    fieldName = "bucket_mode"
  elif fieldName == "bucket_mode":
    fieldName = "bucketMode"

proc renameHook*(v: WorkersObservabilityQuery, fieldName: var string) {.inline.} =
  if fieldName == "createdBy":
    fieldName = "created_by"
  elif fieldName == "created_by":
    fieldName = "createdBy"
  elif fieldName == "updatedBy":
    fieldName = "updated_by"
  elif fieldName == "updated_by":
    fieldName = "updatedBy"

proc renameHook*(v: WorkersObservabilityQueryRun, fieldName: var string) {.inline.} =
  if fieldName == "accountId":
    fieldName = "account_id"
  elif fieldName == "account_id":
    fieldName = "accountId"
  elif fieldName == "userId":
    fieldName = "user_id"
  elif fieldName == "user_id":
    fieldName = "userId"

proc renameHook*(v: WorkersObservabilityTelemetryEvent, fieldName: var string) {.inline.} =
  if fieldName == "$containers":
    fieldName = "containers"
  elif fieldName == "containers":
    fieldName = "$containers"
  elif fieldName == "$metadata":
    fieldName = "metadata"
  elif fieldName == "metadata":
    fieldName = "$metadata"
  elif fieldName == "$workers":
    fieldName = "workers"
  elif fieldName == "workers":
    fieldName = "$workers"

proc renameHook*(v: WorkersObject, fieldName: var string) {.inline.} =
  if fieldName == "hasStoredData":
    fieldName = "has_stored_data"
  elif fieldName == "has_stored_data":
    fieldName = "hasStoredData"

proc renameHook*(v: ZarazBaseMc, fieldName: var string) {.inline.} =
  if fieldName == "blockingTriggers":
    fieldName = "blocking_triggers"
  elif fieldName == "blocking_triggers":
    fieldName = "blockingTriggers"
  elif fieldName == "defaultFields":
    fieldName = "default_fields"
  elif fieldName == "default_fields":
    fieldName = "defaultFields"
  elif fieldName == "defaultPurpose":
    fieldName = "default_purpose"
  elif fieldName == "default_purpose":
    fieldName = "defaultPurpose"
  elif fieldName == "vendorName":
    fieldName = "vendor_name"
  elif fieldName == "vendor_name":
    fieldName = "vendorName"
  elif fieldName == "vendorPolicyUrl":
    fieldName = "vendor_policy_url"
  elif fieldName == "vendor_policy_url":
    fieldName = "vendorPolicyUrl"
  elif fieldName == "neoEvents":
    fieldName = "neo_events"
  elif fieldName == "neo_events":
    fieldName = "neoEvents"

proc renameHook*(v: ZarazBaseTool, fieldName: var string) {.inline.} =
  if fieldName == "blockingTriggers":
    fieldName = "blocking_triggers"
  elif fieldName == "blocking_triggers":
    fieldName = "blockingTriggers"
  elif fieldName == "defaultFields":
    fieldName = "default_fields"
  elif fieldName == "default_fields":
    fieldName = "defaultFields"
  elif fieldName == "defaultPurpose":
    fieldName = "default_purpose"
  elif fieldName == "default_purpose":
    fieldName = "defaultPurpose"
  elif fieldName == "vendorName":
    fieldName = "vendor_name"
  elif fieldName == "vendor_name":
    fieldName = "vendorName"
  elif fieldName == "vendorPolicyUrl":
    fieldName = "vendor_policy_url"
  elif fieldName == "vendor_policy_url":
    fieldName = "vendorPolicyUrl"

proc renameHook*(v: ZarazCustomManagedComponent, fieldName: var string) {.inline.} =
  if fieldName == "blockingTriggers":
    fieldName = "blocking_triggers"
  elif fieldName == "blocking_triggers":
    fieldName = "blockingTriggers"
  elif fieldName == "defaultFields":
    fieldName = "default_fields"
  elif fieldName == "default_fields":
    fieldName = "defaultFields"
  elif fieldName == "defaultPurpose":
    fieldName = "default_purpose"
  elif fieldName == "default_purpose":
    fieldName = "defaultPurpose"
  elif fieldName == "vendorName":
    fieldName = "vendor_name"
  elif fieldName == "vendor_name":
    fieldName = "vendorName"
  elif fieldName == "vendorPolicyUrl":
    fieldName = "vendor_policy_url"
  elif fieldName == "vendor_policy_url":
    fieldName = "vendorPolicyUrl"
  elif fieldName == "neoEvents":
    fieldName = "neo_events"
  elif fieldName == "neo_events":
    fieldName = "neoEvents"

proc renameHook*(v: ZarazManagedComponent, fieldName: var string) {.inline.} =
  if fieldName == "blockingTriggers":
    fieldName = "blocking_triggers"
  elif fieldName == "blocking_triggers":
    fieldName = "blockingTriggers"
  elif fieldName == "defaultFields":
    fieldName = "default_fields"
  elif fieldName == "default_fields":
    fieldName = "defaultFields"
  elif fieldName == "defaultPurpose":
    fieldName = "default_purpose"
  elif fieldName == "default_purpose":
    fieldName = "defaultPurpose"
  elif fieldName == "vendorName":
    fieldName = "vendor_name"
  elif fieldName == "vendor_name":
    fieldName = "vendorName"
  elif fieldName == "vendorPolicyUrl":
    fieldName = "vendor_policy_url"
  elif fieldName == "vendor_policy_url":
    fieldName = "vendorPolicyUrl"
  elif fieldName == "neoEvents":
    fieldName = "neo_events"
  elif fieldName == "neo_events":
    fieldName = "neoEvents"

proc renameHook*(v: ZarazZarazConfigBase, fieldName: var string) {.inline.} =
  if fieldName == "dataLayer":
    fieldName = "data_layer"
  elif fieldName == "data_layer":
    fieldName = "dataLayer"
  elif fieldName == "debugKey":
    fieldName = "debug_key"
  elif fieldName == "debug_key":
    fieldName = "debugKey"
  elif fieldName == "historyChange":
    fieldName = "history_change"
  elif fieldName == "history_change":
    fieldName = "historyChange"
  elif fieldName == "zarazVersion":
    fieldName = "zaraz_version"
  elif fieldName == "zaraz_version":
    fieldName = "zarazVersion"

proc renameHook*(v: ZarazZarazConfigBody, fieldName: var string) {.inline.} =
  if fieldName == "dataLayer":
    fieldName = "data_layer"
  elif fieldName == "data_layer":
    fieldName = "dataLayer"
  elif fieldName == "debugKey":
    fieldName = "debug_key"
  elif fieldName == "debug_key":
    fieldName = "debugKey"
  elif fieldName == "historyChange":
    fieldName = "history_change"
  elif fieldName == "history_change":
    fieldName = "historyChange"
  elif fieldName == "zarazVersion":
    fieldName = "zaraz_version"
  elif fieldName == "zaraz_version":
    fieldName = "zarazVersion"

proc renameHook*(v: ZarazZarazConfigReturn, fieldName: var string) {.inline.} =
  if fieldName == "dataLayer":
    fieldName = "data_layer"
  elif fieldName == "data_layer":
    fieldName = "dataLayer"
  elif fieldName == "debugKey":
    fieldName = "debug_key"
  elif fieldName == "debug_key":
    fieldName = "debugKey"
  elif fieldName == "historyChange":
    fieldName = "history_change"
  elif fieldName == "history_change":
    fieldName = "historyChange"
  elif fieldName == "zarazVersion":
    fieldName = "zaraz_version"
  elif fieldName == "zaraz_version":
    fieldName = "zarazVersion"

proc renameHook*(v: ZarazZarazConfigRowBase, fieldName: var string) {.inline.} =
  if fieldName == "createdAt":
    fieldName = "created_at"
  elif fieldName == "created_at":
    fieldName = "createdAt"
  elif fieldName == "updatedAt":
    fieldName = "updated_at"
  elif fieldName == "updated_at":
    fieldName = "updatedAt"
  elif fieldName == "userId":
    fieldName = "user_id"
  elif fieldName == "user_id":
    fieldName = "userId"

