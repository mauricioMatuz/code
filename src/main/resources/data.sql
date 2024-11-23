-- Crear tabla "tarea"
CREATE TABLE "tarea" (
    "id" BIGSERIAL PRIMARY KEY,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "fecha_inicio" DATE NOT NULL,
    "prioridad" VARCHAR(20) NOT NULL DEFAULT 'media',
    "estado" VARCHAR(150) NOT NULL DEFAULT 'pendiente',
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice en "tarea" sobre el campo "estado"
CREATE INDEX idx_tarea_estado ON "tarea" ("estado");

-- Crear tabla "rol"
CREATE TABLE "rol" (
    "id" BIGSERIAL PRIMARY KEY,
    "rol" VARCHAR(50) NOT NULL UNIQUE,
    "nivel" INT NOT NULL DEFAULT 0
);

-- Crear tabla "UsuarioModel"
CREATE TABLE "usuario" (
    "id" BIGSERIAL PRIMARY KEY,
    "usuario" VARCHAR(50) NOT NULL,
    "contrasenia" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(100) UNIQUE NOT NULL,
    "rol_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice en "UsuarioModel" sobre "correo"
CREATE INDEX idx_usuario_correo ON "usuario" ("correo");

-- Crear índice en "UsuarioModel" sobre "rol_id" (clave foránea)
CREATE INDEX idx_usuario_rol_id ON "usuario" ("rol_id");

-- Crear tabla "reporte"
CREATE TABLE "reporte" (
    "id" BIGSERIAL PRIMARY KEY,
    "path_url" VARCHAR(255) NOT NULL,
    "original_name" VARCHAR(100) NOT NULL,
    "tipo_archivo" VARCHAR(50) NOT NULL,
    "tamanio" BIGINT,
    "extension" VARCHAR(10),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla "reportes_tareas"
CREATE TABLE "reportes_tareas" (
    "reporte_id" BIGINT NOT NULL,
    "tarea_id" BIGINT NOT NULL,
    PRIMARY KEY ("reporte_id", "tarea_id")
);

-- Crear índice en "reportes_tareas" sobre "reporte_id"
CREATE INDEX idx_reportes_tareas_reporte_id ON "reportes_tareas" ("reporte_id");

-- Crear índice en "reportes_tareas" sobre "tarea_id"
CREATE INDEX idx_reportes_tareas_tarea_id ON "reportes_tareas" ("tarea_id");

-- Crear tabla "usuario_tareas"
CREATE TABLE "usuario_tareas" (
    "usuario_id" BIGINT NOT NULL,
    "tarea_id" BIGINT NOT NULL,
    PRIMARY KEY ("usuario_id", "tarea_id")
);

-- Crear índice en "usuario_tareas" sobre "usuario_id"
CREATE INDEX idx_usuario_tareas_usuario_id ON "usuario_tareas" ("usuario_id");

-- Crear índice en "usuario_tareas" sobre "tarea_id"
CREATE INDEX idx_usuario_tareas_tarea_id ON "usuario_tareas" ("tarea_id");

-- Crear tabla "notificacion"
CREATE TABLE "notificacion" (
    "id" BIGSERIAL PRIMARY KEY,
    "usuario_id" BIGINT NOT NULL,
    "mensaje" TEXT NOT NULL,
    "visto" BOOLEAN DEFAULT FALSE,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice en "notificacion" sobre "usuario_id"
CREATE INDEX idx_notificacion_usuario_id ON "notificacion" ("usuario_id");

-- Crear tabla "comentario"
CREATE TABLE "comentario" (
    "id" BIGSERIAL PRIMARY KEY,
    "tarea_id" BIGINT NOT NULL,
    "usuario_id" BIGINT NOT NULL,
    "contenido" TEXT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice en "comentario" sobre "tarea_id"
CREATE INDEX idx_comentario_tarea_id ON "comentario" ("tarea_id");

-- Crear índice en "comentario" sobre "usuario_id"
CREATE INDEX idx_comentario_usuario_id ON "comentario" ("usuario_id");

-- Crear tabla "historial"
CREATE TABLE "historial" (
    "id" BIGSERIAL PRIMARY KEY,
    "tabla" VARCHAR(50) NOT NULL,
    "registro_id" BIGINT NOT NULL,
    "accion" VARCHAR(20) NOT NULL,
    "cambio" JSONB,
    "usuario_id" BIGINT,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear índice en "historial" sobre "usuario_id"
CREATE INDEX idx_historial_usuario_id ON "historial" ("usuario_id");

-- Crear índice en "historial" sobre "registro_id"
CREATE INDEX idx_historial_registro_id ON "historial" ("registro_id");

-- Agregar claves foráneas en una segunda migración
-- Tabla "UsuarioModel": Agregar clave foránea para "rol_id"
ALTER TABLE
    "usuario"
ADD
    CONSTRAINT "fk_usuario_rol_id" FOREIGN KEY ("rol_id") REFERENCES "rol"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- Tabla "reportes_tareas": Agregar claves foráneas
ALTER TABLE
    "reportes_tareas"
ADD
    CONSTRAINT "fk_reportes_tareas_reporte_id" FOREIGN KEY ("reporte_id") REFERENCES "reporte"("id") ON DELETE CASCADE;

ALTER TABLE
    "reportes_tareas"
ADD
    CONSTRAINT "fk_reportes_tareas_tarea_id" FOREIGN KEY ("tarea_id") REFERENCES "tarea"("id") ON DELETE CASCADE;

-- Tabla "usuario_tareas": Agregar claves foráneas
ALTER TABLE
    "usuario_tareas"
ADD
    CONSTRAINT "fk_usuario_tareas_usuario_id" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE CASCADE;

ALTER TABLE
    "usuario_tareas"
ADD
    CONSTRAINT "fk_usuario_tareas_tarea_id" FOREIGN KEY ("tarea_id") REFERENCES "tarea"("id") ON DELETE CASCADE;

-- Tabla "notificacion": Agregar clave foránea
ALTER TABLE
    "notificacion"
ADD
    CONSTRAINT "fk_notificacion_usuario_id" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE CASCADE;

-- Tabla "comentario": Agregar claves foráneas
ALTER TABLE
    "comentario"
ADD
    CONSTRAINT "fk_comentario_tarea_id" FOREIGN KEY ("tarea_id") REFERENCES "tarea"("id") ON DELETE CASCADE;

ALTER TABLE
    "comentario"
ADD
    CONSTRAINT "fk_comentario_usuario_id" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE CASCADE;