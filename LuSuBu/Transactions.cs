//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace LuSuBu
{
    public partial class Transactions
    {
        public Transactions()
        {
            this.Orders = new HashSet<Orders>();
        }
    
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public decimal Amount { get; set; }
        public string RefenceID { get; set; }
        public string Token { get; set; }
        public string PayerID { get; set; }
        public System.DateTime Date { get; set; }
    
        public virtual ICollection<Orders> Orders { get; set; }
    }
    
}
