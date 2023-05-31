package com.scheduling.project.system.rules.service;

import java.util.List;
import com.scheduling.project.system.rules.domain.TypesettingRules;

/**
 * 排版规则管理Service接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface ITypesettingRulesService
{
    /**
     * 查询排版规则管理
     *
     * @param id 排版规则管理主键
     * @return 排版规则管理
     */
    public TypesettingRules selectTypesettingRulesById(Long id);

    /**
     * 查询排版规则管理列表
     *
     * @param typesettingRules 排版规则管理
     * @return 排版规则管理集合
     */
    public List<TypesettingRules> selectTypesettingRulesList(TypesettingRules typesettingRules);

    /**
     * 新增排版规则管理
     *
     * @param typesettingRules 排版规则管理
     * @return 结果
     */
    public int insertTypesettingRules(TypesettingRules typesettingRules);

    /**
     * 修改排版规则管理
     *
     * @param typesettingRules 排版规则管理
     * @return 结果
     */
    public int updateTypesettingRules(TypesettingRules typesettingRules);

    /**
     * 批量删除排版规则管理
     *
     * @param ids 需要删除的排版规则管理主键集合
     * @return 结果
     */
    public int deleteTypesettingRulesByIds(String ids);

    /**
     * 删除排版规则管理信息
     *
     * @param id 排版规则管理主键
     * @return 结果
     */
    public int deleteTypesettingRulesById(Long id);
}
