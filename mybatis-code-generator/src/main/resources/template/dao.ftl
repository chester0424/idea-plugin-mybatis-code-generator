package ${packageName}.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import ${packageName}.${className};
import ${packageName}.${className}QueryParam;

import java.util.List;

/**
 * Product Dao
 */
@Mapper
public interface I${className}Dao {

    int insert(${className} ${className?uncap_first});

    int insertBatch(@Param("coll")List<${className}> ${className?uncap_first}List);

    int update(${className} ${className?uncap_first});

    int delete(@Param("${keyField.name}") String ${keyField.name});

    ${className} get(@Param("${keyField.name}") String ${keyField.name});

    List<${className}> getList(${className}QueryParam param, @Param("pageNumKey") int pageNum, @Param("pageSizeKey") int pageSize);

    int getCount(${className}QueryParam param);
}

<#-- 修改模板生成路径 -->
${callback.setTargetFileDir(targetFileDir+"\\dao")}${callback.setTargetFileName("I"+targetFileName)}