﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SavingsManager.Models.DTOModels;

namespace SavingsManager.Data
{
    public class SavingsDataRepository
    {
        private readonly SavingMgrDbDataContext _savingsDataContext;

        public SavingsDataRepository()
        {
            _savingsDataContext = new SavingMgrDbDataContext();
        }

        #region Group Methods

        public Grupo GetGroupById(int id)
        {
            var group = _savingsDataContext.Grupo.SingleOrDefault(g => g.IdGrupo == id);
            return group;
        }

        public IEnumerable<Grupo> GetAllGroups()
        {
            var groups = _savingsDataContext.Grupo.Select(g => g);
            return groups;
        }

        public void AddGroup(Grupo group)
        {
            _savingsDataContext.Grupo.InsertOnSubmit(group);

            try
            {
                _savingsDataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        #endregion
    }
}