
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
| Ashley   |  4760 |    2024 |  2.35 |
| Laura    | 16795 |    8259 |  2.03 |
| Sam      | 14454 |    7831 |  1.85 |
| Marisha  | 12465 |    7481 |  1.67 |
| Travis   | 12392 |    7499 |  1.65 |
| Liam     | 10682 |    6649 |  1.61 |
| Taliesin | 12271 |    8241 |  1.49 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     5219 |     9114 |  1.75 |
| Laura    |    21168 |    36326 |  1.72 |
| Sam      |    18161 |    28884 |  1.59 |
| Taliesin |    18959 |    27180 |  1.43 |
| Liam     |    17223 |    23283 |  1.35 |
| Marisha  |    21316 |    27853 |  1.31 |
| Travis   |    20864 |    26513 |  1.27 |

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
