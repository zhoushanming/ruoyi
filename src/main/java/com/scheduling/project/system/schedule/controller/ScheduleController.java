package com.scheduling.project.system.schedule.controller;

import java.util.List;

import com.scheduling.project.system.cust.domain.History;
import com.scheduling.project.system.cust.service.IHistoryService;
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
import com.scheduling.project.system.schedule.domain.Schedule;
import com.scheduling.project.system.schedule.service.IScheduleService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 排班管理Controller
 *
 * @author scheduling
 * @date 2023-02-20
 */
@Controller
@RequestMapping("/system/schedule")
public class ScheduleController extends BaseController
{
    private String prefix = "system/schedule";

    @Autowired
    private IHistoryService historyService;

    @RequiresPermissions("system:schedule:view")
    @GetMapping()
    public String schedule()
    {
        return prefix + "/schedule";
    }

    /**
     * 查询排班管理列表
     */
    @RequiresPermissions("system:schedule:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(History history)
    {
        startPage();
        List<History> list = historyService.selectHistoryList(history);
        return getDataTable(list);
    }

    /**
     * 导出排班管理列表
     */
    @RequiresPermissions("system:schedule:export")
    @Log(title = "排班管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(History history)
    {
        List<History> list = historyService.selectHistoryList(history);
        ExcelUtil<History> util = new ExcelUtil<History>(History.class);
        return util.exportExcel(list, "排班管理数据");
    }

//    /**
//     * 新增排班管理
//     */
//    @GetMapping("/add")
//    public String add()
//    {
//        return prefix + "/add";
//    }
//
//    /**
//     * 新增保存排班管理
//     */
//    @RequiresPermissions("system:schedule:add")
//    @Log(title = "排班管理", businessType = BusinessType.INSERT)
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(History schedule)
//    {
//        return toAjax(scheduleService.insertHistory(schedule));
//    }
//
//    /**
//     * 修改排班管理
//     */
//    @RequiresPermissions("system:schedule:edit")
//    @GetMapping("/edit/{id}")
//    public String edit(@PathVariable("id") Long id, ModelMap mmap)
//    {
//        History schedule = scheduleService.selectHistoryById(id);
//        mmap.put("schedule", schedule);
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存排班管理
//     */
//    @RequiresPermissions("system:schedule:edit")
//    @Log(title = "排班管理", businessType = BusinessType.UPDATE)
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(History schedule)
//    {
//        return toAjax(scheduleService.updateHistory(schedule));
//    }
//
//    /**
//     * 删除排班管理
//     */
//    @RequiresPermissions("system:schedule:remove")
//    @Log(title = "排班管理", businessType = BusinessType.DELETE)
//    @PostMapping( "/remove")
//    @ResponseBody
//    public AjaxResult remove(String ids)
//    {
//        return toAjax(scheduleService.deleteHistoryByIds(ids));
//    }
}
