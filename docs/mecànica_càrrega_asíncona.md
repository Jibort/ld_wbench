# Càrrega asíncrona de dades

El mecanisme d'_async/await_ que implementa Dart (i per tant Flutter) provoca que les càrregues de dades per a mostrar en les vistes de les aplicacions s'endarrereixin fins després d'haver-les renderitzat. Això és un problema important perquè el temps que triga en carregar les dades d'una vista pot ser considerablement superior al temps que triga en mostrar-la.

Per tal que que només es renderitzi una vista quan les seves dades inicials s'hagin carregat hem desenvolupat la classe _<u>DeepDo</u>_.

## Classe DeepDo
Aquesta classe és responsable de realitzar les càrregues asíncrones ordenades abans de visualitzar les vistes o d'actualitzar-les. El seu cor és una llista de tipus _FiFo_ on es preparen i s'executen les crides només permetent que un cop finalitzades es renderitzi la pantalla associada.

### Diagrama de classes involucrades


