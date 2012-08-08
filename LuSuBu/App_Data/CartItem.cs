﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LuSuBu;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
	public CartItem(StoreItems product, int qty, string size)
	{
        Product = product;
        Qty = qty;
        Size = size;
		//
		// TODO: Add constructor logic here
		//
	}

    public StoreItems Product
    {
        get;
        set;
    }

    public int Qty
    {
        get;
        set;
    }

    public string Size
    {
        get;
        set;
    }

}