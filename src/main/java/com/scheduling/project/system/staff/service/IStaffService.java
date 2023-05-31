package com.scheduling.project.system.staff.service;

import java.util.List;
import com.scheduling.project.system.staff.domain.Staff;

/**
 * 员工管理Service接口
 *
 * @author scheduling
 * @date 2023-02-14
 */
public interface IStaffService
{
    /**
     * 查询员工管理
     *
     * @param id 员工管理主键
     * @return 员工管理
     */
    public Staff selectStaffById(Long id);

    /**
     * 查询员工管理列表
     *
     * @param staff 员工管理
     * @return 员工管理集合
     */
    public List<Staff> selectStaffList(Staff staff);

    /**
     * 新增员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    public int insertStaff(Staff staff);

    /**
     * 修改员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    public int updateStaff(Staff staff);

    /**
     * 批量删除员工管理
     *
     * @param ids 需要删除的员工管理主键集合
     * @return 结果
     */
    public int deleteStaffByIds(String ids);

    /**
     * 删除员工管理信息
     *
     * @param id 员工管理主键
     * @return 结果
     */
    public int deleteStaffById(Long id);
}
