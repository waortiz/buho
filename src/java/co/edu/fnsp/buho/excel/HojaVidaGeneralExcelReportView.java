/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.HojaVidaConsulta;
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
public class HojaVidaGeneralExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVidaGeneral.xls\"");
        List<HojaVidaConsulta> hojasVida = (List<HojaVidaConsulta>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Hoja de Vida");
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
        
        header.createCell(0).setCellValue("Número de Identificación");
        header.getCell(0).setCellStyle(style);
        sheet.setColumnWidth(0, 30*256);
        header.createCell(1).setCellValue("Tipo de identificación");
        header.getCell(1).setCellStyle(style);
        sheet.setColumnWidth(1, 30*256);
        header.createCell(2).setCellValue("Fecha de expedición");
        header.getCell(2).setCellStyle(style);
        sheet.setColumnWidth(2, 30*256);
        header.createCell(3).setCellValue("Lugar de expedición");
        header.getCell(3).setCellStyle(style);
        sheet.setColumnWidth(3, 80*256);
        header.createCell(4).setCellValue("Nombre y apellidos");
        header.getCell(4).setCellStyle(style);
        sheet.setColumnWidth(4, 80*256);
        header.createCell(5).setCellValue("Sexo");
        header.getCell(5).setCellStyle(style);
        sheet.setColumnWidth(5, 15*256);
        header.createCell(6).setCellValue("Nacionalidad");
        header.getCell(6).setCellStyle(style);
        sheet.setColumnWidth(6, 30*256);
        header.createCell(7).setCellValue("Fecha de nacimiento");
        header.getCell(7).setCellStyle(style);
        sheet.setColumnWidth(7, 30*256);
        header.createCell(8).setCellValue("Lugar de nacimiento");
        header.getCell(8).setCellStyle(style);
        sheet.setColumnWidth(8, 60*256);
        header.createCell(9).setCellValue("Número libreta militar");
        header.getCell(9).setCellStyle(style);
        sheet.setColumnWidth(9, 30*256);
        header.createCell(10).setCellValue("Distrito-clase");
        header.getCell(10).setCellStyle(style);
        sheet.setColumnWidth(10, 15*256);
        header.createCell(11).setCellValue("Ciudad de residencia");
        header.getCell(11).setCellStyle(style);
        sheet.setColumnWidth(11, 60*256);
        header.createCell(12).setCellValue("Dirección");
        header.getCell(12).setCellStyle(style);
        sheet.setColumnWidth(12, 80*256);
        header.createCell(13).setCellValue("Grupo étnico");
        header.getCell(13).setCellStyle(style);
        sheet.setColumnWidth(13, 60*256);
        header.createCell(14).setCellValue("Discapacidad");
        header.getCell(14).setCellStyle(style);
        sheet.setColumnWidth(14, 60*256);
        header.createCell(15).setCellValue("RUT");
        header.getCell(15).setCellStyle(style);
        sheet.setColumnWidth(15, 15*256);
        header.createCell(16).setCellValue("Actividad económica del RUT");
        header.getCell(16).setCellStyle(style);
        sheet.setColumnWidth(16, 80*256);
        header.createCell(17).setCellValue("Tiene disponibilidad para trabajar por fuera de Medellín");
        header.getCell(17).setCellStyle(style);
        sheet.setColumnWidth(17, 15*256);
        header.createCell(18).setCellValue("Egresado de la Universidad de Antioquia");
        header.getCell(18).setCellStyle(style);
        sheet.setColumnWidth(18, 15*256);
        header.createCell(19).setCellValue("Empleado de la Universidad de Antioquia");
        header.getCell(19).setCellStyle(style);
        sheet.setColumnWidth(19, 15*256);
        header.createCell(20).setCellValue("Tipo de vinculación");
        header.getCell(20).setCellStyle(style);
        sheet.setColumnWidth(20, 30*256);
        header.createCell(21).setCellValue("Nivel educativo");
        header.getCell(21).setCellStyle(style);
        sheet.setColumnWidth(21, 50*256);
        header.createCell(22).setCellValue("Experiencia profesional");
        header.getCell(22).setCellStyle(style);
        sheet.setColumnWidth(22, 60*256);
        header.createCell(23).setCellValue("Cargo");
        header.getCell(23).setCellStyle(style);
        sheet.setColumnWidth(23, 80*256);
        header.createCell(24).setCellValue("Tipo de cargo");
        header.getCell(24).setCellStyle(style);
        sheet.setColumnWidth(24, 30*256);
        header.createCell(25).setCellValue("Tipo de investigador");
        header.getCell(25).setCellStyle(style);
        sheet.setColumnWidth(25, 30*256);
        header.createCell(26).setCellValue("Artículos");
        header.getCell(26).setCellStyle(style);
        sheet.setColumnWidth(26, 80*256);
        header.createCell(27).setCellValue("Patente");
        header.getCell(27).setCellStyle(style);
        sheet.setColumnWidth(27, 80*256);
        header.createCell(28).setCellValue("Producto de conocimiento");
        header.getCell(28).setCellStyle(style);
        sheet.setColumnWidth(28, 80*256);
        header.createCell(29).setCellValue("Distinción");
        header.getCell(29).setCellStyle(style);
        sheet.setColumnWidth(80, 80*256);
        header.createCell(30).setCellValue("Título");
        header.getCell(30).setCellStyle(style);
        sheet.setColumnWidth(30, 80*256);
        header.createCell(31).setCellValue("Curso");
        header.getCell(31).setCellStyle(style);
        sheet.setColumnWidth(31, 80*256);
        header.createCell(32).setCellValue("Duración");
        header.getCell(32).setCellStyle(style);
        sheet.setColumnWidth(32, 15*256);
        header.createCell(33).setCellValue("Institución experiencia docencia");
        header.getCell(33).setCellStyle(style);
        sheet.setColumnWidth(33, 80*256);
        header.createCell(34).setCellValue("Curso experiencia docencia");
        header.getCell(34).setCellStyle(style);
        sheet.setColumnWidth(34, 80*256);
        
        int rowNum = 1;
        for (HojaVidaConsulta hojaVida : hojasVida) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getTipoIdentificacion());
            row.createCell(2).setCellValue(hojaVida.getFechaExpedicion());
            row.createCell(3).setCellValue(hojaVida.getLugarExpedicion());
            row.createCell(4).setCellValue(hojaVida.getNombres() + " " + hojaVida.getApellidos());
            row.createCell(5).setCellValue(hojaVida.getSexo());
            row.createCell(6).setCellValue(hojaVida.getNacionalidad());
            row.createCell(7).setCellValue(hojaVida.getFechaNacimiento());
            row.createCell(8).setCellValue(hojaVida.getLugarNacimiento());
            row.createCell(9).setCellValue(hojaVida.getLibretaMilitar());
            row.createCell(10).setCellValue(hojaVida.getDistritoClase());
            row.createCell(11).setCellValue(hojaVida.getCiudadResidencia());
            row.createCell(12).setCellValue(hojaVida.getDireccion());
            row.createCell(13).setCellValue(hojaVida.getGrupoEtnico());
            row.createCell(14).setCellValue(hojaVida.getDiscapacidad());
            row.createCell(15).setCellValue(hojaVida.getDisponeRUT());
            row.createCell(16).setCellValue(hojaVida.getActividadEconomica());
            row.createCell(17).setCellValue(hojaVida.getDisponibilidadViajar());
            row.createCell(18).setCellValue(hojaVida.getEgresadoUDEA());
            row.createCell(19).setCellValue(hojaVida.getEmpleadoUDEA());
            row.createCell(20).setCellValue(hojaVida.getTipoVinculacion());
            row.createCell(21).setCellValue(hojaVida.getNivelEducativo());
            row.createCell(22).setCellValue(hojaVida.getEmpresa());
            row.createCell(23).setCellValue(hojaVida.getCargo());
            row.createCell(24).setCellValue(hojaVida.getTipoCargo());
            row.createCell(25).setCellValue(hojaVida.getTipoInvestigador());
            row.createCell(26).setCellValue(hojaVida.getArticulo());
            row.createCell(27).setCellValue(hojaVida.getPatente());
            row.createCell(28).setCellValue(hojaVida.getProductoConocimiento());
            row.createCell(29).setCellValue(hojaVida.getDistincion());
            row.createCell(30).setCellValue(hojaVida.getTitulo());
            row.createCell(31).setCellValue(hojaVida.getNombreCurso());
            row.createCell(32).setCellValue(hojaVida.getDuracionCurso());
            row.createCell(33).setCellValue(hojaVida.getInstitucionExperienciaDocencia());
            row.createCell(34).setCellValue(hojaVida.getNombreCursoExperienciaDocencia());
        }
    }
}
