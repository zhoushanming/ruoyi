package com.scheduling.project.system.rules.service.impl;

import java.util.List;
import com.scheduling.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.project.system.rules.mapper.TypesettingRulesMapper;
import com.scheduling.project.system.rules.domain.TypesettingRules;
import com.scheduling.project.system.rules.service.ITypesettingRulesService;
import com.scheduling.common.utils.text.Convert;

/**
 * 排版规则管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class TypesettingRulesServiceImpl implements ITypesettingRulesService
{
    @Autowired
    private TypesettingRulesMapper typesettingRulesMapper;

    /**
     * 查询排版规则管理
     *
     * @param id 排版规则管理主键
     * @return 排版规则管理
     */
    @Override
    public TypesettingRules selectTypesettingRulesById(Long id)
    {
        return typesettingRulesMapper.selectTypesettingRulesById(id);
    }

    /**
     * 查询排版规则管理列表
     *
     * @param typesettingRules 排版规则管理
     * @return 排版规则管理
     */
    @Override
    public List<TypesettingRules> selectTypesettingRulesList(TypesettingRules typesettingRules)
    {
        return typesettingRulesMapper.selectTypesettingRulesList(typesettingRules);
    }

    /**
     * 新增排版规则管理
     *
     * @param typesettingRules 排版规则管理
     * @return 结果
     */
    @Override
    public int insertTypesettingRules(TypesettingRules typesettingRules)
    {
        typesettingRules.setCreateTime(DateUtils.getNowDate());
        return typesettingRulesMapper.insertTypesettingRules(typesettingRules);
    }

    /**
     * 修改排版规则管理
     *
     * @param typesettingRules 排版规则管理
     * @return 结果
     */
    @Override
    public int updateTypesettingRules(TypesettingRules typesettingRules)
    {
        typesettingRules.setUpdateTime(DateUtils.getNowDate());
        return typesettingRulesMapper.updateTypesettingRules(typesettingRules);
    }

    /**
     * 批量删除排版规则管理
     *
     * @param ids 需要删除的排版规则管理主键
     * @return 结果
     */
    @Override
    public int deleteTypesettingRulesByIds(String ids)
    {
        return typesettingRulesMapper.deleteTypesettingRulesByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除排版规则管理信息
     *
     * @param id 排版规则管理主键
     * @return 结果
     */
    @Override
    public int deleteTypesettingRulesById(Long id)
    {
        return typesettingRulesMapper.deleteTypesettingRulesById(id);
    }
}
