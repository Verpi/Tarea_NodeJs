import { conectar } from "../models/db_conectar.js";

var crud_estudiante =({});

crud_estudiante.leer = (req,res)=>{
    const estudiantes = `
    SELECT s.id_estudiante,
        s.carne,
        s.nombres,
        s.apellidos,
        s.direccion,
        s.telefono,
        s.correo_electronico,
        ts.sangre,
        s.fecha_nacimiento
    FROM estudiantes AS s
    INNER JOIN tipos_sangre AS ts
    ON s.id_tipo_sangre = ts.id_tipo_sangre
    ORDER BY s.id_estudiante ASC;`;

    conectar.query(estudiantes,(error,results)=>{
        if (error){
            throw error;
    }else{
    res.render('clientes/index',{resultado:results})
    }
})
};
crud_estudiante.cud = (req,res)=>{
    const btn_agregar = req.body.btn_agregar;
    const btn_actualizar = req.body.btn_actualizar;
    const btn_borrar = req.body.btn_borrar;
    const id_estudiante = req.body.txt_id_estudiante;
    const carne = req.body.txt_carne;
    const nombres = req.body.txt_nombres;
    const apellidos = req.body.txt_apellidos;
    const direccion = req.body.txt_direccion;
    const telefono = req.body.txt_telefono;
    const correo_electronico = req.body.txt_correo_electronico;
    const id_tipo_sangre = req.body.txt_id_tipo_sangre;
    const fecha_nacimiento = req.body.txt_fecha_nacimiento;
  
    if (btn_agregar){
        conectar.query('insert into estudiantes SET ?',{id_estudiante:id_estudiante,carne:carne,nombres:nombres,apellidos:apellidos,direccion:direccion,
            telefono:telefono,correo_electronico:correo_electronico,id_tipo_sangre:id_tipo_sangre,fecha_nacimiento:fecha_nacimiento}, (error, results)=>{
            if(error){
                console.log(error);
            }else{
                 
                res.redirect('/');         
            }
        });
       
    }
    if (btn_actualizar){
        conectar.query('UPDATE estudiantes SET ? WHERE id_estudiante = ?',[{id_estudiante:id_estudiante,carne:carne,nombres:nombres,apellidos:apellidos,direccion:direccion,
            telefono:telefono,correo_electronico:correo_electronico,id_tipo_sangre:id_tipo_sangre,fecha_nacimiento:fecha_nacimiento},id_estudiante], (error, results)=>{
            if(error){
                console.log(error);
            }else{
                 
                res.redirect('/');         
            }
        });
       
    }
    if (btn_borrar){
        conectar.query('DELETE FROM estudiantes WHERE id_estudiante = ?',[id_estudiante], (error, results)=>{
            if(error){
                console.log(error);
            }else{
                 
                res.redirect('/');         
            }
        });
       
    }
};
export {crud_estudiante}