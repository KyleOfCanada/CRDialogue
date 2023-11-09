
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

<figure>
<img src="../plots/joySadPlot.png" alt="joyful vs sad" />
<figcaption aria-hidden="true">joyful vs sad</figcaption>
</figure>

| Name     |   Joy | Sadness | Ratio |
|:---------|------:|--------:|------:|
| Ashley   |  6462 |    2531 |  2.55 |
| Laura    | 19112 |    9269 |  2.06 |
| Sam      | 17112 |    8904 |  1.92 |
| Marisha  | 14606 |    8571 |  1.70 |
| Travis   | 15152 |    8943 |  1.69 |
| Liam     | 12232 |    7507 |  1.63 |
| Taliesin | 13905 |    9260 |  1.50 |

We can see that while Liam is in the bottom half of the table, Taliesin
has a lower score.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

<figure>
<img src="../plots/positiveNegativePlot.png"
alt="positive vs negative" />
<figcaption aria-hidden="true">positive vs negative</figcaption>
</figure>

| Name     | Negative | Positive | Ratio |
|:---------|---------:|---------:|------:|
| Ashley   |     6705 |    12870 |  1.92 |
| Laura    |    23947 |    41136 |  1.72 |
| Sam      |    20885 |    34081 |  1.63 |
| Taliesin |    22352 |    31028 |  1.39 |
| Liam     |    19522 |    26126 |  1.34 |
| Marisha  |    24353 |    31731 |  1.30 |
| Travis   |    24950 |    31192 |  1.25 |

We can see that while Liam is again in the bottom half of the table,
both Marisha and Travis have lower scores.

------------------------------------------------------------------------

### References for lexicons

Hu, M., & Liu, B. (2004). Mining and summarizing customer reviews.
Proceedings of the 2004 ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining - KDD ’04, 168.
<https://doi.org/10.1145/1014052.1014073>

Mohammad, S. M., & Turney, P. D. (2013). Crowdsourcing a Word–Emotion
Association Lexicon. Computational Intelligence, 29(3), 436–465.
<https://doi.org/10.1111/j.1467-8640.2012.00460.x>

Nielsen, F. Å. (2011). A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs. ArXiv:1103.2903 \[Cs\].
<http://arxiv.org/abs/1103.2903>
