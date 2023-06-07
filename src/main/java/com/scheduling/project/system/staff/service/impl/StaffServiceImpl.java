package com.scheduling.project.system.staff.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.scheduling.common.utils.DateUtils;
import com.scheduling.common.utils.security.ShiroUtils;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.preferences.mapper.EmployeePreferencesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.scheduling.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.scheduling.project.system.staff.mapper.StaffMapper;
import com.scheduling.project.system.staff.domain.Staff;
import com.scheduling.project.system.staff.service.IStaffService;
import com.scheduling.common.utils.text.Convert;

/**
 * 员工管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class StaffServiceImpl implements IStaffService
{
    @Autowired
    private StaffMapper staffMapper;

    @Autowired
    private EmployeePreferencesMapper employeePreferencesMapper;

    /**
     * 查询员工管理
     *
     * @param id 员工管理主键
     * @return 员工管理
     */
    @Override
    public Staff selectStaffById(Long id)
    {
        return staffMapper.selectStaffById(id);
    }

    /**
     * 查询员工管理列表
     *
     * @param staff 员工管理
     * @return 员工管理
     */
    @Override
    public List<Staff> selectStaffList(Staff staff)
    {
        return staffMapper.selectStaffList(staff);
    }

    /**
     * 新增员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertStaff(Staff staff)
    {
        staff.setCreateTime(DateUtils.getNowDate());
        staff.setDelFlag("0");
        staff.setCreateBy(ShiroUtils.getUserId().toString());
        int rows = staffMapper.insertStaff(staff);
//        insertStaff(staff);
        //添加偏好
        EmployeePreferences employeePreferences=new EmployeePreferences();
        employeePreferences.setPreferenceType(staff.getPreferenceType());
        employeePreferences.setPreferenceValue(staff.getPreferenceValue());
        employeePreferences.setStaff(staff.getId());
        employeePreferences.setCreateTime(DateUtils.getNowDate());
        employeePreferences.setCreateBy(ShiroUtils.getUserId().toString());
        employeePreferences.setDelFlag("0");
        employeePreferencesMapper.insertEmployeePreferences(employeePreferences);
        return rows;
    }

    /**
     * 修改员工管理
     *
     * @param staff 员工管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateStaff(Staff staff)
    {
        staff.setUpdateTime(DateUtils.getNowDate());
        staff.setUpdateBy(ShiroUtils.getUserId().toString());
//        staffMapper.deleteEmployeePreferencesByStaff(staff.getId());
//        insertStaff(staff);
        EmployeePreferences employeePreferences=employeePreferencesMapper.selectEmployeePreferencesBystaff(staff.getId());
        employeePreferences.setPreferenceValue(staff.getPreferenceValue());
        employeePreferences.setPreferenceType(staff.getPreferenceType());
        employeePreferences.setUpdateTime(DateUtils.getNowDate());
        employeePreferences.setUpdateBy(ShiroUtils.getUserId().toString());
        employeePreferencesMapper.updateEmployeePreferences(employeePreferences);
        return staffMapper.updateStaff(staff);
    }

    /**
     * 批量删除员工管理
     *
     * @param ids 需要删除的员工管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStaffByIds(String ids)
    {
        staffMapper.deleteEmployeePreferencesByStaffs(Convert.toStrArray(ids));
        return staffMapper.deleteStaffByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除员工管理信息
     *
     * @param id 员工管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStaffById(Long id)
    {
        staffMapper.deleteEmployeePreferencesByStaff(id);
        return staffMapper.deleteStaffById(id);
    }

    /**
     * 新增员工偏好信息
     *
     * @param staff 员工管理对象
     */
//    public void insertEmployeePreferences(Cust staff)
//    {
//        List<EmployeePreferences> employeePreferencesList = staff.getEmployeePreferencesList();
//        Long id = staff.getId();
//        if (StringUtils.isNotNull(employeePreferencesList))
//        {
//            List<EmployeePreferences> list = new ArrayList<EmployeePreferences>();
//            for (EmployeePreferences employeePreferences : employeePreferencesList)
//            {
//                employeePreferences.setStaff(id);
//                list.add(employeePreferences);
//            }
//            if (list.size() > 0)
//            {
//                staffMapper.batchEmployeePreferences(list);
//            }
//        }
//    }
}
