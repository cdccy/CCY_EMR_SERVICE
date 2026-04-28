package com.ccy.emr.ai.tool.runtime;

import java.util.Map;

public interface FrontendToolInvoker {
    Map<String, Object> invoke(String actionId, String actionName, Map<String, Object> payload, long timeoutMs) throws Exception;
}
