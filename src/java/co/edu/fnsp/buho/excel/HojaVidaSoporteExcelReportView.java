/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.HojaVidaSoporte;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 *
 * @author William
 */
public class HojaVidaSoporteExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVidaSoporte.xls\"");
        List<HojaVidaSoporte> hojasVida = (List<HojaVidaSoporte>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Soporte");
        Row header = sheet.createRow(0);
        
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont fontHead = workbook.createFont();
        fontHead.setBold(true);
        style.setFont(fontHead); 
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBorderLeft(CellStyle.BORDER_THIN);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setAlignment(HorizontalAlignment.CENTER);
        
        header.createCell(0).setCellValue("Cédula");
        header.getCell(0).setCellStyle(style);
        sheet.setColumnWidth(0, 15*256);
        header.createCell(1).setCellValue("Nombres");
        header.getCell(1).setCellStyle(style);
        sheet.setColumnWidth(1, 15*256);
        header.createCell(2).setCellValue("Apellidos");
        header.getCell(2).setCellStyle(style);
        sheet.setColumnWidth(2, 15*256);
        header.createCell(3).setCellValue("Número Soportes Personales Cargados");
        header.getCell(3).setCellStyle(style);
        sheet.setColumnWidth(3, 60*256);
        header.createCell(4).setCellValue("Número Soportes Personales Validados");
        header.getCell(4).setCellStyle(style);
        sheet.setColumnWidth(4, 60*256);
        header.createCell(5).setCellValue("Número Soportes Cargados Experiencia Laboral");
        header.getCell(5).setCellStyle(style);
        sheet.setColumnWidth(5, 60*256);
        header.createCell(6).setCellValue("Número Soportes Validados Experiencia Laboral");
        header.getCell(6).setCellStyle(style);
        sheet.setColumnWidth(6, 60*256);
        header.createCell(7).setCellValue("Número Soportes Cargados Experiencia Docencia");
        header.getCell(7).setCellStyle(style);
        sheet.setColumnWidth(7, 60*256);
        header.createCell(8).setCellValue("Número Soportes Validados Experiencia Docencia");
        header.getCell(8).setCellStyle(style);
        sheet.setColumnWidth(8, 60*256);
        header.createCell(9).setCellValue("Número Soportes Cargados Educación Basica");
        header.getCell(9).setCellStyle(style);
        sheet.setColumnWidth(9, 60*256);
        header.createCell(10).setCellValue("Número Soportes Validados Educación Basica");
        header.getCell(10).setCellStyle(style);
        sheet.setColumnWidth(10, 60*256);
        header.createCell(11).setCellValue("Número Soportes Cargados Educación Continua");
        header.getCell(11).setCellStyle(style);
        sheet.setColumnWidth(11, 60*256);
        header.createCell(12).setCellValue("Número Soportes Validados Educación Continua");
        header.getCell(12).setCellStyle(style);
        sheet.setColumnWidth(12, 60*256);
        header.createCell(13).setCellValue("Número Soportes Cargados Educación Superior");
        header.getCell(13).setCellStyle(style);
        sheet.setColumnWidth(13, 60*256);
        header.createCell(14).setCellValue("Número Soportes Validados Educación Superior");
        header.getCell(14).setCellStyle(style);
        sheet.setColumnWidth(14, 60*256);
        header.createCell(15).setCellValue("Número Soportes Cargados Idioma");
        header.getCell(15).setCellStyle(style);
        sheet.setColumnWidth(15, 60*256);
        header.createCell(16).setCellValue("Número Soportes Validados Idioma");
        header.getCell(16).setCellStyle(style);
        sheet.setColumnWidth(16, 60*256);
        header.createCell(17).setCellValue("Número Soportes Cargados Distinción");
        header.getCell(17).setCellStyle(style);
        sheet.setColumnWidth(17, 60*256);
        header.createCell(18).setCellValue("Número Soportes Validados Distinción");
        header.getCell(18).setCellStyle(style);
        sheet.setColumnWidth(18, 60*256);
        header.createCell(19).setCellValue("Número Soportes Cargados Investigación");
        header.getCell(19).setCellStyle(style);
        sheet.setColumnWidth(19, 60*256);
        header.createCell(20).setCellValue("Número Soportes Validados Investigación");
        header.getCell(20).setCellStyle(style);
        sheet.setColumnWidth(20, 60*256);
        header.createCell(21).setCellValue("Número Soportes Cargados Artículo");
        header.getCell(21).setCellStyle(style);
        sheet.setColumnWidth(21, 60*256);
        header.createCell(22).setCellValue("Número Soportes Validados Artículo");
        header.getCell(22).setCellStyle(style);
        sheet.setColumnWidth(23, 60*256);
        header.createCell(23).setCellValue("Número Soportes Cargados Patente");
        header.getCell(23).setCellStyle(style);
        sheet.setColumnWidth(23, 60*256);
        header.createCell(24).setCellValue("Número Soportes Validados Patente");
        header.getCell(24).setCellStyle(style);
        sheet.setColumnWidth(24, 60*256);
        header.createCell(25).setCellValue("Número Soportes Cargados Producto Conocimiento");
        header.getCell(25).setCellStyle(style);
        sheet.setColumnWidth(25, 60*256);
        header.createCell(26).setCellValue("Número Soportes Validados Producto Conocimiento");
        header.getCell(26).setCellStyle(style);
        sheet.setColumnWidth(26, 60*256);
        header.createCell(27).setCellValue("Número Soportes Cargados Propuesta Investigación");
        header.getCell(27).setCellStyle(style);
        sheet.setColumnWidth(27, 60*256);
        header.createCell(28).setCellValue("Número Soportes Validados Propuesta Investigación");
        header.getCell(28).setCellStyle(style);
        sheet.setColumnWidth(28, 60*256);

        int rowNum = 1;
        for (HojaVidaSoporte hojaVida : hojasVida) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getNombres());
            row.createCell(2).setCellValue(hojaVida.getApellidos());
            row.createCell(3).setCellValue(hojaVida.getNumeroSoportesPersonalesCargados());
            row.createCell(4).setCellValue(hojaVida.getNumeroSoportesPersonalesValidados());
            row.createCell(5).setCellValue(hojaVida.getNumeroSoportesCargadosExperienciaLaboral());
            row.createCell(6).setCellValue(hojaVida.getNumeroSoportesValidadosExperienciaLaboral());
            row.createCell(7).setCellValue(hojaVida.getNumeroSoportesCargadosExperienciaDocencia());
            row.createCell(8).setCellValue(hojaVida.getNumeroSoportesValidadosExperienciaDocencia());
            row.createCell(9).setCellValue(hojaVida.getNumeroSoportesCargadosEducacionBasica());
            row.createCell(10).setCellValue(hojaVida.getNumeroSoportesValidadosEducacionBasica());
            row.createCell(11).setCellValue(hojaVida.getNumeroSoportesCargadosEducacionContinua());
            row.createCell(12).setCellValue(hojaVida.getNumeroSoportesValidadosEducacionContinua());
            row.createCell(13).setCellValue(hojaVida.getNumeroSoportesCargadosEducacionSuperior());
            row.createCell(14).setCellValue(hojaVida.getNumeroSoportesValidadosEducacionSuperior());
            row.createCell(15).setCellValue(hojaVida.getNumeroSoportesCargadosIdioma());
            row.createCell(16).setCellValue(hojaVida.getNumeroSoportesValidadosIdioma());
            row.createCell(17).setCellValue(hojaVida.getNumeroSoportesCargadosDistincion());
            row.createCell(18).setCellValue(hojaVida.getNumeroSoportesValidadosDistincion());
            row.createCell(19).setCellValue(hojaVida.getNumeroSoportesCargadosInvestigacion());
            row.createCell(20).setCellValue(hojaVida.getNumeroSoportesValidadosInvestigacion());
            row.createCell(21).setCellValue(hojaVida.getNumeroSoportesCargadosArticulo());
            row.createCell(22).setCellValue(hojaVida.getNumeroSoportesValidadosArticulo());
            row.createCell(23).setCellValue(hojaVida.getNumeroSoportesCargadosPatente());
            row.createCell(24).setCellValue(hojaVida.getNumeroSoportesValidadosPatente());
            row.createCell(25).setCellValue(hojaVida.getNumeroSoportesCargadosProductoConocimiento());
            row.createCell(26).setCellValue(hojaVida.getNumeroSoportesValidadosProductoConocimiento());
            row.createCell(27).setCellValue(hojaVida.getNumeroSoportesCargadosPropuestaInvestigacion());
            row.createCell(28).setCellValue(hojaVida.getNumeroSoportesValidadosPropuestaInvestigacion());
        }
    }

}
