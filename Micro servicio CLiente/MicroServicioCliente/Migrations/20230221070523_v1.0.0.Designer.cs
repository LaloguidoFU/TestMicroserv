﻿// <auto-generated />
using System;
using MicroServicioCliente;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace MicroServicioCliente.Migrations
{
    [DbContext(typeof(WalletContextDb))]
    [Migration("20230221070523_v1.0.0")]
    partial class v100
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.3")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("MicroServicioCliente.Models.Cuenta", b =>
                {
                    b.Property<int>("IdCuenta")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ClienteId")
                        .HasColumnType("int");

                    b.Property<bool>("Estado")
                        .HasColumnType("bit");

                    b.Property<string>("NumeCuen")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double>("SaldInic")
                        .HasColumnType("float");

                    b.Property<string>("TipoCuen")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdCuenta");

                    b.HasIndex("ClienteId");

                    b.ToTable("Cuentas");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Movimientos", b =>
                {
                    b.Property<int>("IdMovimiento")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ClienteId")
                        .HasColumnType("int");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<double>("Saldo")
                        .HasColumnType("float");

                    b.Property<string>("TipoMovi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double>("Valor")
                        .HasColumnType("float");

                    b.HasKey("IdMovimiento");

                    b.HasIndex("ClienteId");

                    b.ToTable("Movimientos");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Persona", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Direccion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Discriminator")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Edad")
                        .HasColumnType("int");

                    b.Property<string>("Genero")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Telefono")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Personas");

                    b.HasDiscriminator<string>("Discriminator").HasValue("Persona");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Cliente", b =>
                {
                    b.HasBaseType("MicroServicioCliente.Models.Persona");

                    b.Property<int>("Contrasena")
                        .HasColumnType("int");

                    b.Property<bool>("Estado")
                        .HasColumnType("bit");

                    b.HasDiscriminator().HasValue("Cliente");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Cuenta", b =>
                {
                    b.HasOne("MicroServicioCliente.Models.Cliente", "Clientes")
                        .WithMany("Cuentas")
                        .HasForeignKey("ClienteId");

                    b.Navigation("Clientes");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Movimientos", b =>
                {
                    b.HasOne("MicroServicioCliente.Models.Cliente", "Clientes")
                        .WithMany("Movimientos")
                        .HasForeignKey("ClienteId");

                    b.Navigation("Clientes");
                });

            modelBuilder.Entity("MicroServicioCliente.Models.Cliente", b =>
                {
                    b.Navigation("Cuentas");

                    b.Navigation("Movimientos");
                });
#pragma warning restore 612, 618
        }
    }
}