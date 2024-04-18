
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
| Ashley   |  7150 |    2770 |  2.58 |
| Laura    | 19923 |    9671 |  2.06 |
| Sam      | 17927 |    9311 |  1.93 |
| Travis   | 16001 |    9358 |  1.71 |
| Marisha  | 15370 |    9019 |  1.70 |
| Liam     | 12753 |    7849 |  1.62 |
| Taliesin | 14715 |    9862 |  1.49 |

We can see that while Liam is in the bottom half of the table, Taliesin
has a lower score.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     7429 |    14464 |  1.95 |
| Laura    |    25158 |    42950 |  1.71 |
| Sam      |    21858 |    35708 |  1.63 |
| Taliesin |    24094 |    32834 |  1.36 |
| Liam     |    20359 |    27170 |  1.33 |
| Marisha  |    25466 |    33188 |  1.30 |
| Travis   |    26191 |    32611 |  1.25 |

We can see that while Liam is again in the bottom half of the table,
both Marisha and Travis have lower scores.

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
