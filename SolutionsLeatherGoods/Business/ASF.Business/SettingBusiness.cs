﻿//====================================================================================================
// Base code generated with LeatherGoods - ASF.Business
// Architecture Solutions Foundation
//
// Generated by academic at LeatherGoods V 1.0 
//====================================================================================================

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using ASF.Entities;
using ASF.Data;

namespace ASF.Business
{
    /// <summary>
    /// SettingBusiness business component.
    /// </summary>
    public class SettingBusiness
    {

        /// <summary>
        /// Add method. 
        /// </summary>
        /// <param name="setting"></param>
        /// <returns></returns>
        public Setting Add(Setting setting)
        {
            var settingDac = new SettingDAC();
            return settingDac.Create(setting);
        }

        /// <summary>
        /// Delete method.
        /// </summary>
        /// <param name="id"></param>
        public void Remove(int id)
        {
            var settingDac = new SettingDAC();
            settingDac.DeleteById(id);
        }

        /// <summary>
        /// FindAll method.
        /// </summary>
        /// <returns></returns>
        public List<Setting> All()
        {
            var settingDac = new SettingDAC();
            var result = settingDac.Select();
            return result;
        }

        /// <summary>
        /// Find method.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Setting Find(int id)
        {
            var settingDac = new SettingDAC();
            var result = settingDac.SelectById(id);
            return result;
        }

        /// <summary>
        /// Update method.
        /// </summary>
        /// <param name="setting"></param>
        public void Edit(Setting cart)
        {
            var settingDac = new SettingDAC();
            settingDac.UpdateById(cart);
        }

    }
}
