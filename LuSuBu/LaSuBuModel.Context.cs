﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace LuSuBu
{
    public partial class LaSuBuContainer : DbContext
    {
        public LaSuBuContainer()
            : base("name=LaSuBuContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ContentManagement> ContentManagements { get; set; }
        public DbSet<Items1> Items1 { get; set; }
        public DbSet<Orders1> Orders1 { get; set; }
        public DbSet<StoreItem> StoreItems { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<TransactionStatu> TransactionStatus { get; set; }
    }
}
