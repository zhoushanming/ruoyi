package com.scheduling.project.system.rules.controller;

import java.util.List;

import com.scheduling.project.system.store.domain.Store;
import com.scheduling.project.system.store.mapper.StoreMapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.scheduling.framework.aspectj.lang.annotation.Log;
import com.scheduling.framework.aspectj.lang.enums.BusinessType;
import com.scheduling.project.system.rules.domain.TypesettingRules;
import com.scheduling.project.system.rules.service.ITypesettingRulesService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 排版规则管理Controller
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Controller
@RequestMapping("/system/rules")
public class TypesettingRulesController extends BaseController
{
    private String prefix = "system/rules";

    @Autowired
    private ITypesettingRulesService typesettingRulesService;
    @Autowired
    private StoreMapper storeMapper;

    @RequiresPermissions("system:rules:view")
    @GetMapping()
    public String rules()
    {
        return prefix + "/rules";
    }

    /**
     * 查询排版规则管理列表
     */
    @RequiresPermissions("system:rules:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TypesettingRules typesettingRules)
    {
        startPage();

        List<TypesettingRules> list = typesettingRulesService.selectTypesettingRulesList(typesettingRules);
        for (int i = 0; i < list.size(); i++) {
            //门店
            Store store = storeMapper.selectStoreById(Long.valueOf(list.get(i).getStore()));
            if (store != null) {
                list.get(i).setStoreName(store.getName());
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出排版规则管理列表
     */
    @RequiresPermissions("system:rules:export")
    @Log(title = "排版规则管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TypesettingRules typesettingRules)
    {
        List<TypesettingRules> list = typesettingRulesService.selectTypesettingRulesList(typesettingRules);
        ExcelUtil<TypesettingRules> util = new ExcelUtil<TypesettingRules>(TypesettingRules.class);
        return util.exportExcel(list, "排版规则管理数据");
    }

    /**
     * 新增排版规则管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存排版规则管理
     */
    @RequiresPermissions("system:rules:add")
    @Log(title = "排版规则管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TypesettingRules typesettingRules)
    {
        return toAjax(typesettingRulesService.insertTypesettingRules(typesettingRules));
    }

    /**
     * 修改排版规则管理
     */
    @RequiresPermissions("system:rules:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TypesettingRules typesettingRules = typesettingRulesService.selectTypesettingRulesById(id);
        mmap.put("typesettingRules", typesettingRules);
        return prefix + "/edit";
    }

    /**
     * 修改保存排版规则管理
     */
    @RequiresPermissions("system:rules:edit")
    @Log(title = "排版规则管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TypesettingRules typesettingRules)
    {
        return toAjax(typesettingRulesService.updateTypesettingRules(typesettingRules));
    }

    /**
     * 删除排版规则管理
     */
    @RequiresPermissions("system:rules:remove")
    @Log(title = "排版规则管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(typesettingRulesService.deleteTypesettingRulesByIds(ids));
    }
}
