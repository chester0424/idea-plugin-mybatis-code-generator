package ${packageName};

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
<#list fieldTypeImports as import>
import ${import};
</#list>

public class ${className}QueryParam {
    private Map<String, Object> condition = new LinkedHashMap<>();
<#list fields as field>
<#-- 字符串类型 -->
<#if ["char","String","Char"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        condition.put("${field.name}", ${field.name});
    }

    public void set${field.name?cap_first}Array(${field.javaTypeShort}... ${field.name}Array) {
        condition.put("${field.name}_array", ${field.name}Array);
    }
</#if>
<#-- 数字日期类型 -->
<#if ["short","int","long","float","double","Short","Integer","Long","Float","Double","BigDecimal","Date","DateTime"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        condition.put("${field.name}", ${field.name});
    }

    public void set${field.name?cap_first}Range(${field.javaTypeShort} ${field.name}Begin, ${field.javaTypeShort} ${field.name}End) {
        condition.put("${field.name}_range", new HashMap<String, Object>() {{
            put("begin", ${field.name}Begin);
            put("end", ${field.name}End);
        }});
    }
</#if>
<#-- 布尔类型 -->
<#if ["boolean","Boolean"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        condition.put("${field.name}", ${field.name});
    }
</#if>
</#list>

    public void setOrderBy(OrderBy... orders) {
        condition.put("order_array", orders);
    }

<#-- 排序 -->
    public enum OrderBy {
<#list fields as field>
        ${field.name}_asc,
        ${field.name}_desc<#if field?has_next>,<#else>;</#if>
</#list>
    }
}