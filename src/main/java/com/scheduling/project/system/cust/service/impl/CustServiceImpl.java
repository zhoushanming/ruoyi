package com.scheduling.project.system.cust.service.impl;

import com.scheduling.common.utils.DateUtils;
import com.scheduling.common.utils.security.ShiroUtils;
import com.scheduling.common.utils.text.Convert;
import com.scheduling.project.system.cust.domain.Cust;
import com.scheduling.project.system.cust.mapper.CustMapper;

import com.scheduling.project.system.cust.service.ICustService;
import com.scheduling.project.system.preferences.domain.EmployeePreferences;
import com.scheduling.project.system.preferences.mapper.EmployeePreferencesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 员工管理Service业务层处理
 *
 * @author scheduling
 * @date 2023-02-14
 */
@Service
public class CustServiceImpl implements ICustService
{
    @Autowired
    private CustMapper custMapper;


    /**
     * 查询员工管理
     *
     * @param id 员工管理主键
     * @return 员工管理
     */
    @Override
    public Cust selectCustById(Long id)
    {
        return custMapper.selectCustById(id);
    }

    /**
     * 查询员工管理列表
     *
     * @param cust 员工管理
     * @return 员工管理
     */
    @Override
    public List<Cust> selectCustList(Cust cust)
    {
        return custMapper.selectCustList(cust);
    }

    /**
     * 新增员工管理
     *
     * @param cust 员工管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertCust(Cust cust)
    {
        cust.setCreateTime(DateUtils.getNowDate());
        cust.setDelFlag("0");
        cust.setCreateBy(ShiroUtils.getUserId().toString());
        int rows = custMapper.insertCust(cust);
//        insertCust(cust);
        return rows;
    }

    /**
     * 修改员工管理
     *
     * @param cust 员工管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateCust(Cust cust)
    {
        cust.setUpdateTime(DateUtils.getNowDate());
        cust.setUpdateBy(ShiroUtils.getUserId().toString());

        return custMapper.updateCust(cust);
    }

    /**
     * 批量删除员工管理
     *
     * @param ids 需要删除的员工管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteCustByIds(String ids)
    {
        return custMapper.deleteCustByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除员工管理信息
     *
     * @param id 员工管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteCustById(Long id)
    {
        custMapper.deleteEmployeePreferencesByCust(id);
        return custMapper.deleteCustById(id);
    }

    /**
     * 新增员工偏好信息
     *
     * @param cust 员工管理对象
     */
//    public void insertEmployeePreferences(Cust cust)
//    {
//        List<EmployeePreferences> employeePreferencesList = cust.getEmployeePreferencesList();
//        Long id = cust.getId();
//        if (StringUtils.isNotNull(employeePreferencesList))
//        {
//            List<EmployeePreferences> list = new ArrayList<EmployeePreferences>();
//            for (EmployeePreferences employeePreferences : employeePreferencesList)
//            {
//                employeePreferences.setCust(id);
//                list.add(employeePreferences);
//            }
//            if (list.size() > 0)
//            {
//                custMapper.batchEmployeePreferences(list);
//            }
//        }
//    }
}
