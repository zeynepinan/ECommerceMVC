using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace UdemyETicaret
{
    public class MyMail
    {
        #region - Şifre -
        private static string password = "";
        #endregion
        public string ToMail { get; private set; }
        public string Subject { get; private set; }
        public string Body { get; private set; }
        public MyMail(string _tomail, string _subject, string _body)
        {
            this.ToMail = _tomail;
            this.Subject = _subject;
            this.Body = _body;
        }
        public void SendMail()
        {
           
        }
    }
}