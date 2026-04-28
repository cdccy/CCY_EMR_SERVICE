package com.ccy.emr.ai.tool.registry;

import dev.langchain4j.agent.tool.Tool;
import org.springframework.aop.support.AopUtils;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Component
public class MedicalToolRegistry {

    private final List<MedicalToolProvider> toolProviders;
    private final List<String> toolNames;

    public MedicalToolRegistry(List<MedicalToolProvider> toolProviders) {
        this.toolProviders = toolProviders == null ? List.of() : List.copyOf(toolProviders);
        this.toolNames = discoverToolNames(this.toolProviders);
    }

    public List<String> listToolNames() {
        return toolNames;
    }

    public Object[] toolObjects() {
        return toolProviders.toArray();
    }

    private List<String> discoverToolNames(List<MedicalToolProvider> providers) {
        Set<String> names = new LinkedHashSet<>();
        for (MedicalToolProvider provider : providers) {
            Class<?> targetClass = AopUtils.getTargetClass(provider);
            Method[] methods = targetClass.getMethods();
            List<Method> sorted = new ArrayList<>();
            for (Method method : methods) {
                Tool tool = method.getAnnotation(Tool.class);
                if (tool != null) {
                    sorted.add(method);
                }
            }
            sorted.sort(Comparator.comparing(Method::getName));
            for (Method method : sorted) {
                Tool tool = method.getAnnotation(Tool.class);
                String name = tool != null && !tool.name().isBlank() ? tool.name() : method.getName();
                names.add(name);
            }
        }
        return List.copyOf(names);
    }
}
