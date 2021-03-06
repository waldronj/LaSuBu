//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LaSuBuMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transaction
    {
        public Transaction()
        {
            this.Orders1 = new HashSet<Orders1>();
        }
    
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public decimal Amount { get; set; }
        public string RefenceID { get; set; }
        public string Token { get; set; }
        public string PayerID { get; set; }
        public System.DateTime Date { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Zip { get; set; }
        public string State { get; set; }
        public string Email { get; set; }
        public int TransactionStatu_id { get; set; }
        public string TransactionStatu_Description { get; set; }
    
        public virtual ICollection<Orders1> Orders1 { get; set; }
        public virtual TransactionStatu TransactionStatu { get; set; }
    }
}
