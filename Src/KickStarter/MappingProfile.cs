using System;
using AutoMapper;

namespace KickStarter
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserDto>();
        }        
    }

    public class User
    {
        public Guid Id { get; set; }
    }

    public class UserDto
    {
        public Guid Id { get; set; }
    }
}