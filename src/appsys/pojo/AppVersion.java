package pojo;


import java.util.Date;

public class AppVersion {

  private Integer id;
  private Integer appId;
  private String versionNo;
  private String versionInfo;
  private Integer publishStatus;
  private String downloadLink;
  private double versionSize;
  private Integer createdBy;
  private Date creationDate;
  private Integer modifyBy;
  private Date modifyDate;
  private String apkLocPath;
  private String apkFileName;
  private Integer valueId;

  public Integer getValueId() {
    return valueId;
  }

  public void setValueId(Integer valueId) {
    this.valueId = valueId;
  }

  private String softwareName;
  private String valueName;
  public String getSoftwareName() {
    return softwareName;
  }

  public void setSoftwareName(String softwareName) {
    this.softwareName = softwareName;
  }

  public String getValueName() {
    return valueName;
  }

  public void setValueName(String valueName) {
    this.valueName = valueName;
  }
  


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getAppId() {
    return appId;
  }

  public void setAppId(Integer appId) {
    this.appId = appId;
  }


  public String getVersionNo() {
    return versionNo;
  }

  public void setVersionNo(String versionNo) {
    this.versionNo = versionNo;
  }


  public String getVersionInfo() {
    return versionInfo;
  }

  public void setVersionInfo(String versionInfo) {
    this.versionInfo = versionInfo;
  }


  public Integer getPublishStatus() {
    return publishStatus;
  }

  public void setPublishStatus(Integer publishStatus) {
    this.publishStatus = publishStatus;
  }


  public String getDownloadLink() {
    return downloadLink;
  }

  public void setDownloadLink(String downloadLink) {
    this.downloadLink = downloadLink;
  }


  public double getVersionSize() {
    return versionSize;
  }

  public void setVersionSize(double versionSize) {
    this.versionSize = versionSize;
  }


  public Integer getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(Integer createdBy) {
    this.createdBy = createdBy;
  }


  public Date getCreationDate() {
    return creationDate;
  }

  public void setCreationDate(Date creationDate) {
    this.creationDate = creationDate;
  }


  public Integer getModifyBy() {
    return modifyBy;
  }

  public void setModifyBy(Integer modifyBy) {
    this.modifyBy = modifyBy;
  }


  public Date getModifyDate() {
    return modifyDate;
  }

  public void setModifyDate(Date modifyDate) {
    this.modifyDate = modifyDate;
  }


  public String getApkLocPath() {
    return apkLocPath;
  }

  public void setApkLocPath(String apkLocPath) {
    this.apkLocPath = apkLocPath;
  }


  public String getApkFileName() {
    return apkFileName;
  }

  public void setApkFileName(String apkFileName) {
    this.apkFileName = apkFileName;
  }

}
