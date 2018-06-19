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
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
        header.createCell(0).setCellValue("Cédula");
        header.createCell(1).setCellValue("Nombres");
        header.createCell(2).setCellValue("Apellidos");
        header.createCell(3).setCellValue("Número Soportes Personales Cargados");
        header.createCell(4).setCellValue("Número Soportes Personales Validados");
        header.createCell(5).setCellValue("Número Soportes Cargados Experiencia Laboral");
        header.createCell(6).setCellValue("Número Soportes Validados Experiencia Laboral");
        header.createCell(7).setCellValue("Número Soportes Cargados Experiencia Docencia");
        header.createCell(8).setCellValue("Número Soportes Validados Experiencia Docencia");
        header.createCell(9).setCellValue("Número Soportes Cargados Educación Basica");
        header.createCell(10).setCellValue("Número Soportes Validados Educación Basica");
        header.createCell(11).setCellValue("Número Soportes Cargados Educación Continua");
        header.createCell(12).setCellValue("Número Soportes Validados Educación Continua");
        header.createCell(13).setCellValue("Número Soportes Cargados Educación Superior");
        header.createCell(14).setCellValue("Número Soportes Validados Educación Superior");
        header.createCell(15).setCellValue("Número Soportes Cargados Idioma");
        header.createCell(16).setCellValue("Número Soportes Validados Idioma");
        header.createCell(17).setCellValue("Número Soportes Cargados Distinción");
        header.createCell(18).setCellValue("Número Soportes Validados Distinción");
        header.createCell(19).setCellValue("Número Soportes Cargados Investigación");
        header.createCell(20).setCellValue("Número Soportes Validados Investigación");
        header.createCell(21).setCellValue("Número Soportes Cargados Artículo");
        header.createCell(22).setCellValue("Número Soportes Validados Artículo");
        header.createCell(23).setCellValue("Número Soportes Cargados Patente");
        header.createCell(24).setCellValue("Número Soportes Validados Patente");
        header.createCell(25).setCellValue("Número Soportes Cargados Producto Conocimiento");
        header.createCell(26).setCellValue("Número Soportes Validados Producto Conocimiento");
        header.createCell(27).setCellValue("Número Soportes Cargados Propuesta Investigación");
        header.createCell(28).setCellValue("Número Soportes Validados Propuesta Investigación");

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
