package com.scheduling.project.system.staff.controller;

import java.util.List;

import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.preferences.mapper.EmployeePreferencesMapper;
import com.scheduling.project.system.role.domain.Role;
import com.scheduling.project.system.role.mapper.RoleMapper;
import com.scheduling.project.system.staff.mapper.StaffMapper;
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
import com.scheduling.project.system.staff.domain.Staff;
import com.scheduling.project.system.staff.service.IStaffService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 员工管理Controller
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Controller
@RequestMapping("/system/staff")
public class StaffController extends BaseController {
    private String prefix = "system/staff";

    @Autowired
    private IStaffService staffService;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private StaffMapper staffMapper;
    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private EmployeePreferencesMapper employeePreferencesMapper;

    @RequiresPermissions("system:staff:view")
    @GetMapping()
    public String staff() {
        return prefix + "/staff";
    }

    /**
     * 查询员工管理列表
     */
    @RequiresPermissions("system:staff:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Staff staff) {
        startPage();
        List<Staff> list = staffService.selectStaffList(staff);
        for (int i = 0; i < list.size(); i++) {
            //职位
            Role role = roleMapper.selectRoleById(list.get(i).getPosition());
            if (role != null) {
                list.get(i).setPositionName(role.getRoleName());
            }
            //门店
            Store store = storeMapper.selectStoreById(list.get(i).getStoreId());
            if (store != null) {
                list.get(i).setStoreName(store.getName());
            }
            //偏好
            EmployeePreferences employeePreferences = employeePreferencesMapper.selectEmployeePreferencesBystaff(list.get(i).getId());
            if (employeePreferences != null) {
                list.get(i).setPreferenceValue(employeePreferences.getPreferenceValue());
                list.get(i).setPreferenceType(employeePreferences.getPreferenceType());
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出员工管理列表
     */
    @RequiresPermissions("system:staff:export")
    @Log(title = "员工管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Staff staff) {
        List<Staff> list = staffService.selectStaffList(staff);
        ExcelUtil<Staff> util = new ExcelUtil<Staff>(Staff.class);
        return util.exportExcel(list, "员工管理数据");
    }

    /**
     * 新增员工管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存员工管理
     */
    @RequiresPermissions("system:staff:add")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Staff staff) {
        return toAjax(staffService.insertStaff(staff));
    }

    /**
     * 修改员工管理
     */
    @RequiresPermissions("system:staff:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Staff staff = staffService.selectStaffById(id);
        mmap.put("staff", staff);
        return prefix + "/edit";
    }
    @PostMapping("/listname")
    @ResponseBody
    public List<Staff> lists1(String staffId)
    {
        logger.info("----------"+staffId);
        List<Staff> staff=staffMapper.selectStaffByName(staffId);
        return staff;

    }

    /**
     * 修改保存员工管理
     */
    @RequiresPermissions("system:staff:edit")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Staff staff) {
        return toAjax(staffService.updateStaff(staff));
    }

    /**
     * 删除员工管理
     */
    @RequiresPermissions("system:staff:remove")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(staffService.deleteStaffByIds(ids));
    }


}
