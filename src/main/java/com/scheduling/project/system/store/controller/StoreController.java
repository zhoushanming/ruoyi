package com.scheduling.project.system.store.controller;

import java.util.List;

import com.scheduling.project.system.staff.domain.Staff;
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
import com.scheduling.project.system.store.domain.Store;
import com.scheduling.project.system.store.service.IStoreService;
import com.scheduling.framework.web.controller.BaseController;
import com.scheduling.framework.web.domain.AjaxResult;
import com.scheduling.common.utils.poi.ExcelUtil;
import com.scheduling.framework.web.page.TableDataInfo;

/**
 * 门店管理Controller
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Controller
@RequestMapping("/system/store")
public class StoreController extends BaseController
{
    private String prefix = "system/store";

    @Autowired
    private IStoreService storeService;

    @RequiresPermissions("system:store:view")
    @GetMapping()
    public String store()
    {
        return prefix + "/store";
    }

    /**
     * 查询门店管理列表
     */
    @RequiresPermissions("system:store:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Store store)
    {
        startPage();
        List<Store> list = storeService.selectStoreList(store);
        return getDataTable(list);
    }

    /**
     * 导出门店管理列表
     */
    @RequiresPermissions("system:store:export")
    @Log(title = "门店管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Store store)
    {
        List<Store> list = storeService.selectStoreList(store);
        ExcelUtil<Store> util = new ExcelUtil<Store>(Store.class);
        return util.exportExcel(list, "门店管理数据");
    }

    /**
     * 新增门店管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存门店管理
     */
    @RequiresPermissions("system:store:add")
    @Log(title = "门店管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Store store)
    {
        return toAjax(storeService.insertStore(store));
    }

    /**
     * 修改门店管理
     */
    @RequiresPermissions("system:store:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Store store = storeService.selectStoreById(id);
        mmap.put("store", store);
        return prefix + "/edit";
    }

    /**
     * 修改保存门店管理
     */
    @RequiresPermissions("system:store:edit")
    @Log(title = "门店管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Store store)
    {
        return toAjax(storeService.updateStore(store));
    }

    /**
     * 删除门店管理
     */
    @RequiresPermissions("system:store:remove")
    @Log(title = "门店管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(storeService.deleteStoreByIds(ids));
    }

    /**
     *根据id查询
     * @return
     */
    @GetMapping("/listname")
    @ResponseBody
    public Store lists1(Long categoryId)
    {
        logger.info("------Store----"+categoryId);
        Store store=storeService.selectStoreById(categoryId);

        return store;

    }
}
