/**
 * Created by girish on 2019-05-06.
 */

public with sharing class CPQ_Utils {


    public static Product2 getProduct(String productCode) {

        String sql = 'SELECT ' + getFieldsAsCsv(Product2.SObjectType) + ' FROM Product2 WHERE ProductCode=' + '\'' + productCode + '\'';
        System.Debug(sql);
        Product2 product2 = Database.query(sql);
        return product2;


    }

    private static String getFieldsAsCsv(SObjectType objType) {
        CPQ_StringBuilder.MultiCurrencyFieldListBuilder sb = new CPQ_StringBuilder.MultiCurrencyFieldListBuilder(getsObjectFields(objType));
        return sb.getStringValue();
    }

    private static List<SObjectField> getsObjectFields(SObjectType objType) {
        return new List<SObjectField>(objType.getDescribe().fields.getMap().values());
    }


}