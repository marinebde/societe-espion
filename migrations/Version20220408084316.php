<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220408084316 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE planque ADD mission_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE planque ADD CONSTRAINT FK_4B3A04BABE6CAE90 FOREIGN KEY (mission_id) REFERENCES mission (id)');
        $this->addSql('CREATE INDEX IDX_4B3A04BABE6CAE90 ON planque (mission_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE planque DROP FOREIGN KEY FK_4B3A04BABE6CAE90');
        $this->addSql('DROP INDEX IDX_4B3A04BABE6CAE90 ON planque');
        $this->addSql('ALTER TABLE planque DROP mission_id');
    }
}
