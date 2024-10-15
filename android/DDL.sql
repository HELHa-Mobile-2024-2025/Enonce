CREATE TABLE `Evaluation`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `parent_id` BIGINT NOT NULL,
    `class_id` BIGINT NOT NULL,
    `points_max` BIGINT NOT NULL
);
CREATE TABLE `Student`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `class_id` BIGINT NOT NULL
);
CREATE TABLE `Class`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Note`(
    `eval_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` BIGINT NOT NULL,
    `note` DOUBLE NOT NULL
);
ALTER TABLE
    `Evaluation` ADD CONSTRAINT `evaluation_id_foreign` FOREIGN KEY(`id`) REFERENCES `Note`(`eval_id`);
ALTER TABLE
    `Evaluation` ADD CONSTRAINT `evaluation_parent_id_foreign` FOREIGN KEY(`parent_id`) REFERENCES `Evaluation`(`id`);
ALTER TABLE
    `Note` ADD CONSTRAINT `note_student_id_foreign` FOREIGN KEY(`student_id`) REFERENCES `Student`(`id`);
ALTER TABLE
    `Evaluation` ADD CONSTRAINT `evaluation_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `Class`(`id`);
ALTER TABLE
    `Student` ADD CONSTRAINT `student_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `Class`(`id`);