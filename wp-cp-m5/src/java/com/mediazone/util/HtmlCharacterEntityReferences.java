package com.mediazone.util;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class HtmlCharacterEntityReferences
{

    public HtmlCharacterEntityReferences()
    {
        Properties entityReferences;
        InputStream is;
        characterToEntityReferenceMap = new String[3000];
        entityReferenceToCharacterMap = new HashMap(252);
        entityReferences = new Properties();
       
        try{
			 is = (com.mediazone.util.HtmlCharacterEntityReferences.class).getResourceAsStream("HtmlCharacterEntityReferences.properties");
			 entityReferences.load(is);
			 is.close();
        }catch(Exception e){
			
        }

        int referredChar;
        String reference;
        for(Enumeration keys = entityReferences.propertyNames(); keys.hasMoreElements(); entityReferenceToCharacterMap.put(reference, new Character((char)referredChar)))
        {
            String key = (String)keys.nextElement();
            referredChar = Integer.parseInt(key);
            int index = referredChar >= 1000 ? referredChar - 7000 : referredChar;
            reference = entityReferences.getProperty(key);
            characterToEntityReferenceMap[index] = '&' + reference + ';';
        }

        return;
    }

    public int getSupportedReferenceCount()
    {
        return entityReferenceToCharacterMap.size();
    }

    public boolean isMappedToReference(char character)
    {
        return convertToReference(character) != null;
    }

    public String convertToReference(char character)
    {
        if(character < '\u03E8' || character >= '\u1F40' && character < '\u2710')
        {
            int index = character >= '\u03E8' ? character - 7000 : ((int) (character));
            String entityReference = characterToEntityReferenceMap[index];
            if(entityReference != null)
                return entityReference;
        }
        return null;
    }

    public char convertToCharacter(String entityReference)
    {
        Character referredCharacter = (Character)entityReferenceToCharacterMap.get(entityReference);
        if(referredCharacter != null)
            return referredCharacter.charValue();
        else
            return '\uFFFF';
    }

    static final char REFERENCE_START = 38;
    static final String DECIMAL_REFERENCE_START = "&#";
    static final String HEX_REFERENCE_START = "&#x";
    static final char REFERENCE_END = 59;
    static final char CHAR_NULL = 65535;
    private static final String PROPERTIES_FILE = "HtmlCharacterEntityReferences.properties";
    private final String characterToEntityReferenceMap[];
    private final Map entityReferenceToCharacterMap;
}