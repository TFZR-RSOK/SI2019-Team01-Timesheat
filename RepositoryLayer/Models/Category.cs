﻿namespace TimeshEAT.RepositoryLayer.Models
{
	public class Category : Entity
	{
		public Category() { }
		public Category(int id, string name) : base(id)
		{
			Name = name;
		}

		public string Name { get; set; }
	}
}
