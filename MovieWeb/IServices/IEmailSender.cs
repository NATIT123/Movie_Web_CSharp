﻿namespace MovieWeb.IServices
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string email, string subject, string message);
    }
}