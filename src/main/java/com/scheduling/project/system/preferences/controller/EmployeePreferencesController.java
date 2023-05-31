package com.scheduling.project.system.preferences.controller;

import java.util.List;
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
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.preferences.service.IEmployeePreferencesService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 员工偏好Controller
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Controller
@RequestMapping("/system/preferences")
public class EmployeePreferencesController extends BaseController
{
    private String prefix = "system/preferences";

    @Autowired
    private IEmployeePreferencesService employeePreferencesService;

    @RequiresPermissions("system:preferences:view")
    @GetMapping()
    public String preferences()
    {
        return prefix + "/preferences";
    }

    /**
     * 查询员工偏好列表
     */
    @RequiresPermissions("system:preferences:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EmployeePreferences employeePreferences)
    {
        startPage();
        List<EmployeePreferences> list = employeePreferencesService.selectEmployeePreferencesList(employeePreferences);
        return getDataTable(list);
    }

    /**
     * 导出员工偏好列表
     */
    @RequiresPermissions("system:preferences:export")
    @Log(title = "员工偏好", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EmployeePreferences employeePreferences)
    {
        List<EmployeePreferences> list = employeePreferencesService.selectEmployeePreferencesList(employeePreferences);
        ExcelUtil<EmployeePreferences> util = new ExcelUtil<EmployeePreferences>(EmployeePreferences.class);
        return util.exportExcel(list, "员工偏好数据");
    }

    /**
     * 新增员工偏好
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存员工偏好
     */
    @RequiresPermissions("system:preferences:add")
    @Log(title = "员工偏好", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EmployeePreferences employeePreferences)
    {
        return toAjax(employeePreferencesService.insertEmployeePreferences(employeePreferences));
    }

    /**
     * 修改员工偏好
     */
    @RequiresPermissions("system:preferences:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        EmployeePreferences employeePreferences = employeePreferencesService.selectEmployeePreferencesById(id);
        mmap.put("employeePreferences", employeePreferences);
        return prefix + "/edit";
    }

    /**
     * 修改保存员工偏好
     */
    @RequiresPermissions("system:preferences:edit")
    @Log(title = "员工偏好", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EmployeePreferences employeePreferences)
    {
        return toAjax(employeePreferencesService.updateEmployeePreferences(employeePreferences));
    }

    /**
     * 删除员工偏好
     */
    @RequiresPermissions("system:preferences:remove")
    @Log(title = "员工偏好", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(employeePreferencesService.deleteEmployeePreferencesByIds(ids));
    }
}
