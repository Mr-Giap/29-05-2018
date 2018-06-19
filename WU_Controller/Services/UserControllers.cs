using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WU_Models.Model;
using WU_Controller.BaseController;
using WU_ValueObjects;

namespace WU_Controller.Services
{
    public class UserControllers : BaseAccount<vAccount>
    {
        public override vAccount checkLogin(vAccount user)
        {
            return usermd.checkLogin(user);
        }
        public override List<vAccount> GetallUser()
        {
            return usermd.GetallUser();
        }
        public override bool InsertUser(vAccount user)
        {
            return usermd.InsertUser(user);
        }
        public override bool UpdateUser(vAccount user)
        {
            return usermd.UpdateUser(user);
        }
        public override bool DeleteUser(vAccount user)
        {
            return usermd.DeleteUser(user);
        }
    }
}
