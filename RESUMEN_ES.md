# Resumen de resultados (español)

## Qué se probó

La hipótesis del archivo "Todo es Memoria.docx" afirma que dos cantidades biofísicas
—la **profundidad del pozo atractor** (gobernada por motivos disinápticos) y la
**resistencia al ruido σ**— generan un continuo con cuatro cuadrantes: conducta
flexible, autismo (atractores hiperprofundos), Alzheimer (atractores superficiales)
y Parkinson (atractor parásito).

El propio archivo advierte que **no existe evidencia que respalde la propuesta tal
como se presenta**. Por eso el artículo no la asume: la **pone a prueba**.

## Qué se hizo

- Red de Kuramoto de 68 osciladores sobre un **conectoma humano real** (Desikan–Killiany,
  difusión-MRI, distribuido con The Virtual Brain) con retardos de conducción derivados
  de las longitudes de tracto medidas.
- Plasticidad estructural **con compuerta de motivos disinápticos** y **escalado
  homeostático**: la ganancia de consolidación *g* redistribuye el acoplamiento a fuerza
  nodal constante. Así *g* cambia la **forma** del paisaje y no su intensidad global.
  Con *g* = 0 se recupera exactamente el Kuramoto estándar.
- Punto de trabajo fijado **maximizando metastabilidad**, y luego validado contra tres
  anclajes empíricos que no participaron del ajuste.
- 22 marcadores **preespecificados**, 441 puntos del plano (g, σ), 20 realizaciones en
  cada uno de 5 puntos de operación, pruebas de permutación, IC bootstrap, Hedges' g y
  control FDR de Benjamini–Hochberg sobre las 132 pruebas.
- **62 referencias verificadas (60 con DOI contra la API de Crossref + 2 clásicas)**; ninguna se escribió
  de memoria y ninguna quedó sin resolver.

## Qué salió

**1. El punto de trabajo es creíble.** Dwell de 106,4 ± 2,7 ms (rango empírico de
microestados: 60–120 ms); correlación estructura–función r = 0,418 ± 0,006 (rango
publicado 0,30–0,70); ocupación de estados menores 0,2016 ± 0,0087 frente a 0,226
publicado para controles típicos (error relativo −10,8 %). Ninguno entró en la calibración.

**2. El eje de ruido funciona.** El cuadrante Alzheimer reproduce **6 de 7** marcadores
publicados con el signo correcto y todos significativos: caen metastabilidad, sincronía
y potencia alfa; suben theta y la razón theta/alfa.

**3. El eje de "inercia de memoria" falla, y falla al revés.** Subir *g* **sí**
esculpe el paisaje (la concentración del acoplamiento sube con tamaño de efecto 53),
pero **acorta** la residencia en los atractores en vez de alargarla, y **expande** el
repertorio en vez de colapsarlo. En el plano completo, el dwell máximo, la tasa de
transición mínima y el repertorio más concentrado ocurren todos en **g = 0**.
El cuadrante autismo resulta sistemáticamente **antipredictivo** (1 de 7; binomial P = 0,98).

**4. El resultado negativo está blindado.** Se probaron **ocho** implementaciones
alternativas de "profundizar el pozo" (con y sin homeostasis; τ_c de 50 ms a 4 s;
τ_r de 10 a 200 ms). En las ocho el dwell **baja** con *g*: ρ de Spearman entre −0,961 y
−0,988, todas con P ≤ 2,5 × 10⁻¹⁰.

**5. La hipersincronía es inalcanzable** a presupuesto de acoplamiento conservado, lo que
deja el fenotipo parkinsoniano fuera del plano por razones de principio.

**6. Dónde viven de verdad las firmas y cómo se resuelve por completo la ambigüedad ASD–PD.**
Una búsqueda dirigida sobre 263 ajustes recupera las tres firmas clínicas completas en el plano
de **presupuesto de acoplamiento K** y **velocidad de conducción v**. Con los 4 criterios globales
de la literatura, Alzheimer se separa perfectamente (Jaccard = 0,000), mientras que el 83,9 % (26/31)
de los ajustes parkinsonianos satisfacen también los 4 criterios temporales autistas (Jaccard = 0,388)
porque a alta velocidad de conducción (*v* ≥ 18 m/s) desaparece la supresión de frecuencia inducida por
retardos y la red se bloquea en la banda beta (13,8–19,5 Hz). Al incorporar la **tercera coordenada**
descubierta en el estudio —la **especificidad espectral-espacial** (preservación del portador alfa/theta
inducido por retardos sin inflación beta en ASD frente a desplazamiento beta o consolidación focal en el
núcleo sensoriomotor de 12 nodos *g*_SM = 16 en Parkinson)— **el solapamiento cae al 0 % (Jaccard = 0,000
entre los tres síndromes: 34/34 ASD, 119/119 AD y 31/31 PD estrictamente exclusivos)**, definiendo los
rangos exactos de coordenadas (*K*, *v*, *g*_SM, *σ*), su traducción a biomarcadores medibles (PLV en
M/EEG, mapeo de mielina *g*-ratio + latencias TMS-EEG/CCEP, ráfagas beta en M1/S1 y exponente aperiódico 1/*f*)
y el protocolo experimental multimodal para su validación clínica.

## Conclusión

La hipótesis *"Everything is memory?"* queda **falsada** si "memoria" se restringe a la consolidación
sináptica local por pares (*g*), la cual concentra el acoplamiento localmente pero desestabiliza los
atractores globales, pero **se sostiene** si "memoria" se entiende como el *prior* estructural-dinámico
multiescala codificado en el conectoma (*K*, *v*, *g*_SM, *σ*). El trabajo entrega las coordenadas exactas,
libres de solapamiento (Jaccard = 0,000), y el protocolo clínico multimodal para la siguiente prueba.
