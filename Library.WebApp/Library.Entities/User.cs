﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Library.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string RoleName { get; set; }
        public int RoleId { get; set; }
    }
}
