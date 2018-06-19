using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WU_ValueObjects;
using WU_Models.BaseModel;

namespace WU_Models.Model
{
    public class UserModels: BaseAccount<vAccount>
    {
        public override vAccount checkLogin(vAccount user)
        {
            vAccount acc = new vAccount();
            var checkuser = db.SP_CheckLogin(user.UserName, user.PassWord).FirstOrDefault();
            if(checkuser != null)
            {
                acc.UserId = checkuser.UserId;
                acc.UserName = checkuser.UserName;
                acc.PassWord = checkuser.PassWord;
                acc.Mobile = checkuser.Email;
                acc.Email = checkuser.Email;
                acc.Description = checkuser.Description;

                return acc;
            }
            else
            {
                return acc;
            }
        }
        public override List<vAccount> GetallUser()
        {
            List<vAccount> listtk = new List<vAccount>();
            var listallus = db.SP_Get_Account_all();
            if(listallus != null)
            {
                foreach (var item in listallus)
                {
                    vAccount acc = new vAccount();
                    acc.UserId = item.UserId;
                    acc.UserName = item.UserName;
                    acc.PassWord = item.PassWord;
                    acc.Mobile = item.Email;
                    acc.Email = item.Email;
                    acc.Description = item.Description;

                    listtk.Add(acc);
                }
                return listtk;
            }
            else
            {
                return listtk;
            }
        }
        public override bool InsertUser(vAccount user)
        {
            int check = db.SP_Insert_Account(user.UserId, user.UserName, user.PassWord, user.Email, user.Mobile, user.Description);
            return true;
        }
        public override bool UpdateUser(vAccount user)
        {
            db.SP_Insert_Account(user.UserId, user.UserName, user.PassWord, user.Email, user.Mobile, user.Description);
            return true;
        }
        public override bool DeleteUser(vAccount user)
        {
            db.SP_Delete_Account(user.UserId);
            return true; 
        }
    }
}
