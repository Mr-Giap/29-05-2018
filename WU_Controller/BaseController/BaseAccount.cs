using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WU_Models.Model;

namespace WU_Controller.BaseController
{
    public class BaseAccount<T>
    {
        protected UserModels usermd = new UserModels();
        public virtual T checkLogin(T user) { return user; }
        public virtual List<T> GetallUser() { List<T> list = new List<T>(); return list; }
        public virtual bool InsertUser(T user) { return false; }
        public virtual bool UpdateUser(T user) { return false; }
        public virtual bool DeleteUser(T user) { return false; }
    }
}
