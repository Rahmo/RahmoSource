namespace ICStars2_0.Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Init : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Organizations", "Site_Id", "dbo.MVPSites");
            DropIndex("dbo.Organizations", new[] { "Site_Id" });
            RenameColumn(table: "dbo.Organizations", name: "Site_Id", newName: "SiteId");
            AddColumn("dbo.MVPSites", "SiteId", c => c.Int(nullable: false, identity: true));
            AlterColumn("dbo.Organizations", "SiteId", c => c.Int(nullable: false));
            DropPrimaryKey("dbo.MVPSites", new[] { "Id" });
            AddPrimaryKey("dbo.MVPSites", "SiteId");
            AddForeignKey("dbo.Organizations", "SiteId", "dbo.MVPSites", "SiteId", cascadeDelete: true);
            CreateIndex("dbo.Organizations", "SiteId");
            DropColumn("dbo.MVPSites", "Id");
        }
        
        public override void Down()
        {
            AddColumn("dbo.MVPSites", "Id", c => c.Int(nullable: false, identity: true));
            DropIndex("dbo.Organizations", new[] { "SiteId" });
            DropForeignKey("dbo.Organizations", "SiteId", "dbo.MVPSites");
            DropPrimaryKey("dbo.MVPSites", new[] { "SiteId" });
            AddPrimaryKey("dbo.MVPSites", "Id");
            AlterColumn("dbo.Organizations", "SiteId", c => c.String());
            DropColumn("dbo.MVPSites", "SiteId");
            RenameColumn(table: "dbo.Organizations", name: "SiteId", newName: "Site_Id");
            CreateIndex("dbo.Organizations", "Site_Id");
            AddForeignKey("dbo.Organizations", "Site_Id", "dbo.MVPSites", "Id");
        }
    }
}
