package org.phenoscape.phenoday

import org.phenoscape.owl.build.SingleMatrixKB
import java.io.File
import java.io.InputStreamReader
import org.phenoscape.kb.matrix.ConstructPresenceAbsenceMatrix
import org.apache.commons.io.IOUtils
import org.apache.commons.io.FileUtils

object Main extends App {

  val inputMatrix = new File(args(0))
  val bigdataJournal = new File("bigdata.jnl")
  val tboxFile = new File("tbox.owl")
  val propertiesText = IOUtils.toString(this.getClass().getResourceAsStream("/bigdata.properties"), "utf-8")
  val propertiesFile = new File("bigdata.properties")
  FileUtils.writeStringToFile(propertiesFile, propertiesText, "utf-8")
  SingleMatrixKB.buildKB(inputMatrix, propertiesFile, bigdataJournal, tboxFile)
  val anatomyExpressionPath = "anatomy.dl"
  val anatomicalStructureID = "<http://purl.obolibrary.org/obo/UBERON_0000061>"
  val taxonomyExpressionPath = "taxonomy.dl"
  val vertebrataID = "<http://purl.obolibrary.org/obo/VTO_0000007>"
  FileUtils.writeStringToFile(new File(anatomyExpressionPath), anatomicalStructureID, "utf-8")
  FileUtils.writeStringToFile(new File(taxonomyExpressionPath), vertebrataID, "utf-8")
  ConstructPresenceAbsenceMatrix.main(Array(
    "--all", propertiesFile.getAbsolutePath, bigdataJournal.getAbsolutePath, tboxFile.getAbsolutePath, anatomyExpressionPath, taxonomyExpressionPath, "presence-absence-matrix.xml"))

}