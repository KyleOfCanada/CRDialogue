
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
| :------- | ----: | ------: | ----: |
| Ashley   |  3713 |    1650 |  2.25 |
| Robbie   |   552 |     251 |  2.20 |
| Laura    | 15311 |    7516 |  2.04 |
| Sam      | 12835 |    7082 |  1.81 |
| Marisha  | 11331 |    6884 |  1.65 |
| Travis   | 10848 |    6650 |  1.63 |
| Liam     |  9745 |    6118 |  1.59 |
| Taliesin | 10939 |    7452 |  1.47 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    19349 |    33115 |  1.71 |
| Robbie   |      693 |     1185 |  1.71 |
| Ashley   |     4322 |     7192 |  1.66 |
| Sam      |    16460 |    25578 |  1.55 |
| Taliesin |    16171 |    24052 |  1.49 |
| Liam     |    15824 |    21501 |  1.36 |
| Marisha  |    19539 |    25622 |  1.31 |
| Travis   |    18382 |    23786 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.

-----

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
