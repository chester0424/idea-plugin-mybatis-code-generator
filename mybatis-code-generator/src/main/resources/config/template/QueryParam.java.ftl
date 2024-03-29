package ${packageName};

import java.util.HashMap;

<#list fieldTypeImports as import>
import ${import};
</#list>

/**
 * ${className} Dao
 *
 * @author ${authorName}
 * @since ${.now?string("yyyy-MM-dd HH:mm:ss")}
 */
public class ${className}QueryParam extends HashMap<String, Object> {
<#list fields as field>
    public static final String field_${field.name}="${field.name}";

</#list>
<#list fields as field>
<#-- 字符串类型 -->
    <#if ["char","String","Char"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        put("${field.name}", ${field.name});
    }

    public void set${field.name?cap_first}Array(${field.javaTypeShort}... ${field.name}Array) {
        put("${field.name}_array", ${field.name}Array);
    }
    </#if>
<#-- 数字日期类型 -->
    <#if ["short","int","long","float","double","Short","Integer","Long","Float","Double","BigDecimal","Date","DateTime"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        put("${field.name}", ${field.name});
    }

    public void set${field.name?cap_first}Range(${field.javaTypeShort} ${field.name}Begin, ${field.javaTypeShort} ${field.name}End) {
        put("${field.name}_range", new HashMap<String, Object>() {{
            put("begin", ${field.name}Begin);
            put("end", ${field.name}End);
        }});
    }
    </#if>
<#-- 布尔类型 -->
    <#if ["boolean","Boolean"]?seq_contains(field.javaTypeShort)>

    public void set${field.name?cap_first}(${field.javaTypeShort} ${field.name}) {
        put("${field.name}", ${field.name});
    }
    </#if>
</#list>

    public void setOrderBy(OrderBy... orders) {
        put("order_array", orders);
    }


<#-- 排序 -->
    public enum OrderBy {
<#list fields as field>
    <#if ["char","String","Char","short","int","long","float","double","Short","Integer","Long","Float","Double","BigDecimal","Date","DateTime","boolean","Boolean"]?seq_contains(field.javaTypeShort)>
        ${field.name}_asc,
        ${field.name}_desc<#if field?has_next>,<#else>;</#if>
    </#if>
</#list>
    }
}

<#-- 修改模板生成路径 -->
<#-- ${callback.setTargetFileDir(targetFileDir+"\\dao")} -->
<#-- ${callback.setTargetFileName(className+"QueryParam.java")} -->