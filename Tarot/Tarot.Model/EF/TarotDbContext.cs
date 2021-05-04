using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Tarot.Model.EF
{
    public partial class TarotDbContext : DbContext
    {
        public TarotDbContext()
            : base("name=TarotDbContext")
        {
        }

        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<ContentTag> ContentTags { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<NewCategory> NewCategories { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductType> ProductTypes { get; set; }
        public virtual DbSet<Publisher> Publishers { get; set; }
        public virtual DbSet<RegisterStudent> RegisterStudents { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cart>()
                .Property(e => e.Discount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Cart>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Cart>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ContentTag>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Feedback>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<NewCategory>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<NewCategory>()
                .HasMany(e => e.News)
                .WithRequired(e => e.NewCategory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<News>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<News>()
                .HasMany(e => e.ContentTags)
                .WithRequired(e => e.News)
                .HasForeignKey(e => e.NewID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PaymentMethod>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<PaymentMethod>()
                .HasMany(e => e.Carts)
                .WithRequired(e => e.PaymentMethod)
                .HasForeignKey(e => e.PaymentID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.ProductCategory)
                .HasForeignKey(e => e.CategoryID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Carts)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductType>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ProductType>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.ProductType)
                .HasForeignKey(e => e.TypeID);

            modelBuilder.Entity<Publisher>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Publisher>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Publisher)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RegisterStudent>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .HasMany(e => e.ContentTags)
                .WithRequired(e => e.Tag)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);
        }
    }
}
