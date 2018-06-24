/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.Articulo;
import co.edu.fnsp.buho.entidades.Distincion;
import co.edu.fnsp.buho.entidades.DocumentoSoporte;
import co.edu.fnsp.buho.entidades.EducacionBasica;
import co.edu.fnsp.buho.entidades.EducacionContinua;
import co.edu.fnsp.buho.entidades.EducacionSuperior;
import co.edu.fnsp.buho.entidades.ExperienciaLaboral;
import co.edu.fnsp.buho.entidades.HojaVida;
import co.edu.fnsp.buho.entidades.Idioma;
import co.edu.fnsp.buho.entidades.Patente;
import co.edu.fnsp.buho.entidades.ProductoConocimiento;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 *
 * @author William
 */
@Service
public class HojaVidaExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVida.xls\"");
        List<HojaVida> hojasVida = (List<HojaVida>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Hoja de Vida");
        int rowNum = 0;

        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont fontHead = workbook.createFont();
        fontHead.setBold(true);
        style.setFont(fontHead); 
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBorderLeft(CellStyle.BORDER_THIN);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setAlignment(HorizontalAlignment.CENTER);
    
        sheet.setColumnWidth(0, 25*256);
        sheet.setColumnWidth(1, 25*256);
        sheet.setColumnWidth(2, 25*256);
        sheet.setColumnWidth(3, 25*256);
        
        for (HojaVida hojaVida : hojasVida) {
            Row header = sheet.createRow(rowNum++);
            header.createCell(0).setCellValue("Cédula");
            header.getCell(0).setCellStyle(style);
            header.createCell(1).setCellValue("Nombres");
            header.getCell(1).setCellStyle(style);
            header.createCell(2).setCellValue("Apellidos");
            header.getCell(2).setCellStyle(style);

            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getNombres());
            row.createCell(2).setCellValue(hojaVida.getApellidos());

            if (hojaVida.getDocumentosSoporte().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Documentos de soporte(Foto,certificados bancarios, EPS, ARL, AFP entre otros)");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 1));
                cell.setCellStyle(style);

                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Tipo de documento");
                header.createCell(1).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                for (DocumentoSoporte documentoSoporte : hojaVida.getDocumentosSoporte()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(documentoSoporte.getNombreTipoDocumento());
                    row.createCell(1).setCellValue(documentoSoporte.getNombreValidado());
                }
            }

            if (hojaVida.getEducacionesBasicas().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Estudios educación básica");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 4));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Nivel de estudio");
                header.createCell(1).setCellValue("Institución");
                header.createCell(2).setCellValue("Título");
                header.createCell(3).setCellValue("Año título");
                header.createCell(4).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                header.getCell(4).setCellStyle(style);
                for (EducacionBasica educacionBasica : hojaVida.getEducacionesBasicas()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(educacionBasica.getNombreNivel());
                    row.createCell(1).setCellValue(educacionBasica.getInstitucion());
                    row.createCell(2).setCellValue(educacionBasica.getTitulo());
                    row.createCell(3).setCellValue(educacionBasica.getAnyoFinalizacion());
                    row.createCell(4).setCellValue(educacionBasica.getNombreCertificadoValidado());
                }
            }

            if (hojaVida.getEducacionesSuperiores().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Estudios educación superior");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 5));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Nivel de estudio");
                header.createCell(1).setCellValue("Institución");
                header.createCell(2).setCellValue("Programa cursado");
                header.createCell(3).setCellValue("Fecha de título");
                header.createCell(4).setCellValue("Homologación validada");
                header.createCell(5).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                header.getCell(4).setCellStyle(style);
                header.getCell(5).setCellStyle(style);
                for (EducacionSuperior educacionSuperior : hojaVida.getEducacionesSuperiores()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(educacionSuperior.getNombreNivel());
                    row.createCell(1).setCellValue(educacionSuperior.getInstitucion());
                    row.createCell(2).setCellValue(educacionSuperior.getNombrePrograma());
                    row.createCell(3).setCellValue(educacionSuperior.getFechaTituloFormateada());
                    row.createCell(4).setCellValue(educacionSuperior.getNombreCertificadoHomologadoValidado());
                    row.createCell(5).setCellValue(educacionSuperior.getNombreCertificadoValidado());
                }
            }

            if (hojaVida.getIdiomas().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Estudios idiomas");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 5));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Idioma");
                header.createCell(1).setCellValue("Lectura");
                header.createCell(2).setCellValue("Escucha");
                header.createCell(3).setCellValue("Escritura");
                header.createCell(4).setCellValue("Habla");
                header.createCell(5).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                header.getCell(4).setCellStyle(style);
                header.getCell(5).setCellStyle(style);
                for (Idioma idioma : hojaVida.getIdiomas()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(idioma.getNombreIdioma());
                    row.createCell(1).setCellValue(idioma.getNombreNivelLectura());
                    row.createCell(2).setCellValue(idioma.getNombreNivelEscucha());
                    row.createCell(3).setCellValue(idioma.getNombreNivelEscritura());
                    row.createCell(4).setCellValue(idioma.getNombreNivelConversacion());
                    row.createCell(5).setCellValue(idioma.getNombreCertificadoValidado());
                }
            }            
            
            if (hojaVida.getEducacionesContinuas().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Estudios educación no formal");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 4));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Tipo de capacitación");
                header.createCell(1).setCellValue("Nombre de capacitación");
                header.createCell(2).setCellValue("Institución");
                header.createCell(3).setCellValue("Número de horas");
                header.createCell(4).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                header.getCell(4).setCellStyle(style);
                for (EducacionContinua educacionContinua : hojaVida.getEducacionesContinuas()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(educacionContinua.getNombreTipoCapacitacion());
                    row.createCell(1).setCellValue(educacionContinua.getNombreCapacitacion());
                    row.createCell(2).setCellValue(educacionContinua.getNombreInstitucion());
                    row.createCell(3).setCellValue(educacionContinua.getNumeroHoras());
                    row.createCell(4).setCellValue(educacionContinua.getNombreCertificadoValidado());
                }
            }             
            
            if (hojaVida.getExperienciasLaborales().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Experiencia laboral");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 3));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Área");
                header.createCell(1).setCellValue("Empresa/Institución");
                header.createCell(2).setCellValue("Cargo");
                header.createCell(3).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                for (ExperienciaLaboral experienciaLaboral : hojaVida.getExperienciasLaborales()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(experienciaLaboral.getNombreNucleoBasicoConocimiento());
                    row.createCell(1).setCellValue(experienciaLaboral.getNombreEmpresa());
                    row.createCell(2).setCellValue(experienciaLaboral.getCargo());
                    row.createCell(3).setCellValue(experienciaLaboral.getNombreCertificadoValidado());
                }
            }

            if (hojaVida.getArticulos().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Articulos y publicaciones relevantes");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 2));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Título");
                header.createCell(1).setCellValue("Revista");
                header.createCell(2).setCellValue("Enlace");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                for (Articulo articulo : hojaVida.getArticulos()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(articulo.getNombreNucleoBasicoConocimiento());
                    row.createCell(1).setCellValue(articulo.getNombreRevista());
                    row.createCell(2).setCellValue(articulo.getUrl());
                }
            }
            
            if (hojaVida.getPatentes().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Articulos y publicaciones relevantes");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 4));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Fecha");
                header.createCell(1).setCellValue("Tipo");
                header.createCell(2).setCellValue("Propiedad compartida");
                header.createCell(3).setCellValue("Descripción");
                header.createCell(4).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                header.getCell(4).setCellStyle(style);
                for (Patente patente : hojaVida.getPatentes()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(patente.getFechaFormateada());
                    row.createCell(1).setCellValue(patente.getNombreTipo());
                    row.createCell(2).setCellValue(patente.getNombrePropiedadCompartida());
                    row.createCell(3).setCellValue(patente.getDescripcion());
                    row.createCell(4).setCellValue(patente.getNombreDocumentoValidado());
                }
            }

            if (hojaVida.getProductosConocimiento().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Productos de conocimiento");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 3));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Tipo");
                header.createCell(1).setCellValue("Cita");
                header.createCell(2).setCellValue("Descripción");
                header.createCell(3).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                for (ProductoConocimiento productoConocimiento : hojaVida.getProductosConocimiento()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(productoConocimiento.getNombreTipo());
                    row.createCell(1).setCellValue(productoConocimiento.getUrl());
                    row.createCell(2).setCellValue(productoConocimiento.getDescripcion());
                    row.createCell(3).setCellValue(productoConocimiento.getNombreDocumentoValidado());
                }
            }

            if (hojaVida.getDistinciones().size() > 0) {
                sheet.createRow(rowNum++);
                header = sheet.createRow(rowNum++);
                Cell cell = header.createCell(0);
                cell.setCellValue("Distinciones, premios y reconocimientos");
                sheet.addMergedRegion(new CellRangeAddress(rowNum - 1, rowNum - 1, 0, 3));
                cell.setCellStyle(style);
                
                header = sheet.createRow(rowNum++);
                header.createCell(0).setCellValue("Institución otorga");
                header.createCell(1).setCellValue("Descripción");
                header.createCell(2).setCellValue("Fecha de distinción");
                header.createCell(3).setCellValue("Validado");
                header.getCell(0).setCellStyle(style);
                header.getCell(1).setCellStyle(style);
                header.getCell(2).setCellStyle(style);
                header.getCell(3).setCellStyle(style);
                for (Distincion distincion : hojaVida.getDistinciones()) {
                    row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(distincion.getInstitucionOtorga());
                    row.createCell(1).setCellValue(distincion.getDescripcion());
                    row.createCell(2).setCellValue(distincion.getFechaDistincionFormateada());
                    row.createCell(3).setCellValue(distincion.getNombreCertificadoValidado());
                }
            }

            sheet.createRow(rowNum++);
            sheet.createRow(rowNum++);
        }
    }
}
